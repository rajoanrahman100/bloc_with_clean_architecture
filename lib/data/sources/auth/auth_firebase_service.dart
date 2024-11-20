import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc_clean_arch_firebase/core/constants/app_urls.dart';
import 'package:flutter_bloc_clean_arch_firebase/data/model/auth/create_user_req.dart';
import 'package:flutter_bloc_clean_arch_firebase/data/model/auth/signin_user_req.dart';
import 'package:flutter_bloc_clean_arch_firebase/data/model/auth/user.dart';
import 'package:flutter_bloc_clean_arch_firebase/domain/entities/auth/user.dart';

abstract class AuthFirebaseService {
  Future<Either> signIn(SignInUserReq signinUserReq);

  Future<Either> signUp(CreateUserReq createUserReq);

  Future<Either> getUSer();
}

class AuthFirebaseServiceImpl extends AuthFirebaseService {
  @override
  Future<Either> signIn(SignInUserReq signinUserReq) async {
    try {
      await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: signinUserReq.email, password: signinUserReq.password);

      return const Right('Signin was Successful');
    } on FirebaseAuthException catch (e) {
      String message = '';

      if (e.code == 'invalid-email') {
        message = 'Not user found for that email';
      } else if (e.code == 'invalid-credential') {
        message = 'Wrong password provided for that user';
      }

      return Left(message);
    }
  }

  @override
  Future<Either> signUp(CreateUserReq createUserReq) async {
    try {
      var data = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: createUserReq.email, password: createUserReq.password);

      //add user to firestore database
      FirebaseFirestore.instance
          .collection("Users")
          .doc(data.user!.uid)
          .set({'name': createUserReq.fullName, 'email': data.user!.email});

      return const Right("Sign up successfully");
    } on FirebaseAuthException catch (e) {
      String message = "";

      if (e.code == 'weak-password') {
        message = 'The password provided is too weak.';
      } else if (e.code == 'email-already-in-use') {
        message = 'The account already exists for that email.';
      }

      return Left(message);
    }
  }

  @override
  Future<Either> getUSer() async {
    // TODO: implement getUSer
    try {
      FirebaseAuth fAuth = FirebaseAuth.instance;
      FirebaseFirestore fStore = FirebaseFirestore.instance;

      var user = await fStore.collection("Users").doc(fAuth.currentUser!.uid).get();

      UserModel userModel = UserModel.fromJson(user.data()!);
      userModel.imageURL = fAuth.currentUser!.photoURL ?? AppURLs.defaultImage;

      UserEntity userEntity = userModel.toEntity();

      return Right(userEntity);
    } catch (e) {
      return Left("An Error Occurd");
    }
  }
}
