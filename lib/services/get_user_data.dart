import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:coffee_app/models/user_model.dart';
import 'package:firebase_auth/firebase_auth.dart';

class GetUserData {
  CollectionReference users = FirebaseFirestore.instance.collection('users');
  Future<UserModel> getUserData() async {
    String? email = FirebaseAuth.instance.currentUser!.email;
    final snapshot = await users.where("email", isEqualTo: email).get();

    final userData = snapshot.docs.map((e) => UserModel.fromSnabShot(e)).single;
    return userData;
  }
}
