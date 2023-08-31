import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:coffee_app/models/user_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthInitial());
  CollectionReference users = FirebaseFirestore.instance.collection('users');
  Future<void> registerUser({
    required String email,
    required String password,
  }) async {
    emit(LoadingRegistration());
    try {
      // ignore: unused_local_variable
      final credential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      emit(SuccessRegistration());
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        emit(FailureRegistration(
            errmessge: 'The password provided is too weak.'));
      } else if (e.code == 'email-already-in-use') {
        emit(FailureRegistration(
            errmessge: 'The account already exists for that email.'));
      }
    } catch (e) {
      emit(FailureRegistration(errmessge: "something went wrong"));
    }
  }

  Future<void> loginUser(
      {required String email, required String password}) async {
    emit(LoadingLogin());
    try {
      // ignore: unused_local_variable
      final credential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
      emit(SuccessLogin());
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        emit(FailureLogin(errmessge: 'No user found for that email.'));
      } else if (e.code == 'wrong-password') {
        emit(FailureLogin(errmessge: 'Wrong password provided for that user.'));
      }
    }
  }

  createUser(UserModel user) async {
    await users.add(user.toJson());
  }
}
