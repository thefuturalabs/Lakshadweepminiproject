import 'package:bubble/bubble.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  TextEditingController chatController = TextEditingController();
  CollectionReference data = FirebaseFirestore.instance.collection('messages');
  String userName = '';
  List result = [];
  bool isSend = false;
  bool fake = true;
  addUser({required String name, required String message}) {
    data
        .add({'name': name, 'message': message, 'createdAt': DateTime.now()})
        .then((value) => print('User added'))
        .catchError((error) => print("Failed to add user: $error"));
  }

  getName() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    String? name = pref.getString('userName');
    setState(() {
      userName = name!;
    });
  }

  Future<void> getMessage() async {
    QuerySnapshot user = await data.orderBy('createdAt').get();
    setState(() {
      result = user.docs;
    });
  }

  @override
  void initState() {
    getName();
    // TODO: implement initState
    super.initState();
  }

  ScrollController scroll = ScrollController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(userName),
      ),
      body: Container(
        margin: const EdgeInsets.all(10),
        child: Column(
          children: [
            Expanded(
                child: GestureDetector(
              onTap: () {
                FocusScope.of(context).unfocus();
              },
              child: StreamBuilder(
                stream: data.orderBy('createdAt', descending: true).snapshots(),
                builder: (context, snapshot) {
                  if (snapshot.hasError) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(child: CircularProgressIndicator());
                  }
                  var document = snapshot.data?.docs;
                  return ListView.builder(
                    reverse: true,
                    controller: scroll,
                    itemCount: snapshot.data!.size,
                    itemBuilder: (context, index) {
                      return //Align(
                          //   alignment: userName == document![index]['name']
                          //       ? Alignment.topRight
                          //       : Alignment.topLeft,
                          // child: Container(
                          //     margin: const EdgeInsets.all(10),
                          //     padding: const EdgeInsets.all(10),
                          //     decoration: BoxDecoration(
                          //         color: Colors.grey,
                          //         borderRadius: BorderRadius.circular(20)),
                          //     child: Column(
                          //       children: [
                          //         Text(document[index]['name']),
                          //         Text(document[index]['message']),

                          //       ],
                          //     )),
                          GestureDetector(
                        onLongPress: () {},
                        child: Bubble(
                            padding: const BubbleEdges.all(10),
                            alignment: userName == document![index]['name']
                                ? Alignment.topRight
                                : Alignment.topLeft,
                            nip: userName == document[index]['name']
                                ? BubbleNip.rightTop
                                : BubbleNip.leftTop,
                            margin: const BubbleEdges.all(10),
                            color: const Color.fromARGB(255, 219, 222, 148),
                            child: Container(
                              constraints: const BoxConstraints(maxWidth: 250),
                              child: IntrinsicHeight(
                                child: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        userName != document[index]['name']
                                            ? Column(
                                                children: [
                                                  Text(
                                                    document[index]['name'],
                                                    style: const TextStyle(
                                                        color: Colors.blueGrey),
                                                  ),
                                                  const SizedBox(
                                                    height: 0,
                                                  ),
                                                ],
                                              )
                                            : Container(
                                                width: 0,
                                              ),
                                        Container(
                                          constraints: const BoxConstraints(
                                              maxWidth: 180),
                                          child: Text(
                                            document[index]['message'],
                                            textAlign: TextAlign.start,
                                          ),
                                        ),
                                        const SizedBox(
                                          height: 2,
                                        )
                                      ],
                                    ),
                                    const SizedBox(
                                      width: 10,
                                    ),
                                    Column(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        Text(
                                          DateFormat('jmz')
                                              .format(document[index]
                                                      ['createdAt']
                                                  .toDate())
                                              .toString(),
                                          style: const TextStyle(fontSize: 10),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            )),
                      );
                    },
                  );
                },
              ),
            )),
            const SizedBox(
              height: 20,
            ),
            IntrinsicHeight(
              child: Row(
                children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width / 1.2,
                    child: TextField(
                      keyboardType: TextInputType.emailAddress,
                      maxLines: null,
                      // expands: true,
                      textAlignVertical: TextAlignVertical.center,
                      controller: chatController,
                      decoration: InputDecoration(
                          contentPadding: const EdgeInsets.symmetric(
                              vertical: 10, horizontal: 20),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30))),
                    ),
                  ),
                  IconButton(
                      onPressed: () {
                        addUser(name: userName, message: chatController.text);

                        chatController.clear();
                        scroll.animateTo(scroll.position.minScrollExtent,
                            duration: const Duration(milliseconds: 10),
                            curve: Curves.easeOut);
                      },
                      icon: const Icon(Icons.send_rounded))
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
