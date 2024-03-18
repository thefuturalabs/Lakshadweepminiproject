import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:file_picker/file_picker.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';

class UploadScreen extends StatefulWidget {
  const UploadScreen({Key? key}) : super(key: key);

  @override
  _UploadScreenState createState() => _UploadScreenState();
}

class _UploadScreenState extends State<UploadScreen> {
  final FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;
  final FirebaseStorage _firebaseStorage = FirebaseStorage.instance;
  List<UploadTask> uploadedTasks = [];
  List<File> selectedFiles = [];
  late User? user;

  @override
  void initState() {
    super.initState();
    user = FirebaseAuth.instance.currentUser;
  }

  UploadTask uploadFileToStorage(File file) {
    UploadTask task = _firebaseStorage
        .ref()
        .child('images/${user?.uid}/${DateTime.now().toString()}')
        .putFile(file);

    return task;
  }

  void writeImageToFirestore(String imageUrl) {
    _firebaseFirestore
        .collection('images')
        .doc(user?.uid)
        .collection('userImages')
        .add({'url': imageUrl})
        .then((_) => print("$imageUrl is saved in Firestore"))
        .catchError((error) => print("Error saving to Firestore: $error"));
  }

  void saveImageUrlToFirebase(UploadTask task) {
    task.snapshotEvents.listen((snapshot) {
      if (snapshot.state == TaskState.success) {
        snapshot.ref
            .getDownloadURL()
            .then((imageUrl) => writeImageToFirestore(imageUrl));
      }
    });
  }

  Future<void> selectFileToUpload() async {
    try {
      FilePickerResult? result = await FilePicker.platform
          .pickFiles(allowMultiple: true, type: FileType.image);

      if (result != null) {
        selectedFiles.clear();

        for (var selectedFile in result.files) {
          File file = File(selectedFile.path ?? "");
          selectedFiles.add(file);
        }

        for (var file in selectedFiles) {
          final UploadTask task = uploadFileToStorage(file);
          saveImageUrlToFirebase(task);

          setState(() {
            uploadedTasks.add(task);
          });
        }
      } else {
        print('User has cancelled the selection');
      }
    } catch (e) {
      print('Error selecting file: $e');
    }
  }

  void signOutUser() {
    FirebaseAuth.instance.signOut();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(150),
        child: AppBar(
          title: const Text(
            'Demo',
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),
          centerTitle: true,
          actions: [
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.search, color: Colors.white),
            ),
            IconButton(
              onPressed: () {
                signOutUser();
              },
              icon: const Icon(Icons.logout, color: Colors.white),
            ),
          ],
          backgroundColor: Colors.black,
          leading: const CircleAvatar(),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          selectFileToUpload();
        },
        child: const Icon(Icons.add),
      ),
      body: Center(
        child: Stack(
          children: [
            Container(
              color: Colors.black,
            ),
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(40),
              ),
              child: DefaultTabController(
                length: 2,
                child: Column(
                  children: [
                    const TabBar(
                      tabs: [
                        Tab(
                          height: 50,
                          text: 'Acount Details',
                        ),
                        Tab(
                          text: "My Photos",
                        )
                      ],
                      labelStyle: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                        color: Colors.black,
                      ),
                      unselectedLabelStyle: TextStyle(
                        fontWeight: FontWeight.normal,
                        fontSize: 20,
                        color: Colors.grey,
                      ),
                    ),
                    Expanded(
                      child: TabBarView(
                        children: [
                          uploadedTasks.isEmpty
                              ? Container(
                                  child: Center(
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text('Logged in: ${user?.email}'),
                                        const SizedBox(
                                          height: 20,
                                        ),
                                        ElevatedButton(
                                            style: const ButtonStyle(
                                                backgroundColor:
                                                    MaterialStatePropertyAll(
                                                        Colors.amber)),
                                            onPressed: () {
                                              signOutUser();
                                            },
                                            child: const Text(
                                              'LOGOUT',
                                              style: TextStyle(
                                                  color: Colors.black,
                                                  fontWeight: FontWeight.bold),
                                            ))
                                      ],
                                    ),
                                  ),
                                )
                              : ListView.separated(
                                  itemBuilder: (context, index) {
                                    return StreamBuilder<TaskSnapshot>(
                                      stream:
                                          uploadedTasks[index].snapshotEvents,
                                      builder: (context, snapshot) {
                                        return snapshot.connectionState ==
                                                ConnectionState.waiting
                                            ? const Center(
                                                child:
                                                    CircularProgressIndicator())
                                            : snapshot.hasError
                                                ? const Text(
                                                    'There is some error in uploading file')
                                                : snapshot.hasData
                                                    ? ListTile(
                                                        title: Text(
                                                            "${snapshot.data?.bytesTransferred}/${snapshot.data?.totalBytes}${snapshot.data?.state == TaskState.success ? 'completed' : snapshot.data?.state == TaskState.running ? 'in progress' : ''}"),
                                                      )
                                                    : Container();
                                      },
                                    );
                                  },
                                  separatorBuilder: (context, index) =>
                                      const Divider(),
                                  itemCount: uploadedTasks.length,
                                ),
                          Container(
                            padding: const EdgeInsets.all(8),
                            child: StreamBuilder(
                              stream: _firebaseFirestore
                                  .collection('images')
                                  .doc(user?.uid)
                                  .collection('userImages')
                                  .snapshots(),
                              builder: (context, snapshot) {
                                return snapshot.hasError
                                    ? const Center(
                                        child: Text(
                                            'There is some problem loading your images'),
                                      )
                                    : snapshot.hasData
                                        ? GridView.count(
                                            crossAxisCount: 2,
                                            mainAxisSpacing: 16,
                                            crossAxisSpacing: 16,
                                            childAspectRatio: 1,
                                            children: snapshot.data!.docs
                                                .map((e) => Image.network(
                                                      e.get('url'),
                                                      fit: BoxFit.cover,
                                                    ))
                                                .toList(),
                                          )
                                        : Container();
                              },
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
