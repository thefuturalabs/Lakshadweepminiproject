// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_core/firebase_core.dart';
// import 'package:flutter/material.dart';

// class GallryScreen extends StatefulWidget {
//   const GallryScreen({super.key});

//   @override
//   State<GallryScreen> createState() => _GallryScreenState();
// }

// class _GallryScreenState extends State<GallryScreen> {
//   FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Container(
//         padding: EdgeInsets.all(8),
//         child: StreamBuilder(
//             stream: _firebaseFirestore.collection('images').snapshots(),
//             builder: (context, snapshot) {
//               return snapshot.hasError
//                   ? Center(
//                       child: Text('there is some problem loading your image'),
//                     )
//                   : snapshot.hasData
//                       ? GridView.count(
//                           crossAxisCount: 2,
//                           mainAxisSpacing: 16,
//                           crossAxisSpacing: 16,
//                           childAspectRatio: 1,
//                           children: snapshot.data!.docs.map((e) => Image.network(e.get('url'))).toList(),

//                         )
//                       : Container();
//             }),
//       ),
//     );
//   }
// }
