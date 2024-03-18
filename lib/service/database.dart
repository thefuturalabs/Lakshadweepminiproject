// import 'package:cloud_firestore/cloud_firestore.dart';
//
// class DatabaseMethoord{
//
//   Future addQuestion(Map<String ,dynamic> Questioninfomap,String id) async{
//  return await FirebaseFirestore.instance.collection("question").doc(id).set(Questioninfomap);
//   }
// }

import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseMethod {
  Future<void> addQuestion(Map<String, dynamic> questionInfoMap, String id) async {
    return await FirebaseFirestore.instance.collection("questions").doc(id).set(questionInfoMap);
  }
}
