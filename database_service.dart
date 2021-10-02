import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseService {
  Future<void> addQuizData(Map quizData, String quizId) async {
    await FirebaseFirestore.instance
        .collection('categories')
        .doc(quizId)
        .set(quizData)
        .catchError((e) {
      print(e.toString());
    });
  }

  // getting data
  getCategories({limit}) async {
    await FirebaseFirestore.instance.collection('categories').orderBy('name').limit(limit).snapshots();
  }
}
