
//This repository will be implemented on the data layer
import 'package:dartz/dartz.dart';
import 'package:flutter_bloc_clean_arch_firebase/data/model/auth/create_user_req.dart';
import 'package:flutter_bloc_clean_arch_firebase/data/model/auth/signin_user_req.dart';

abstract class AuthRepository {

  Future<Either> signIn(SignInUserReq signinUserReq);
  Future<Either> signUp(CreateUserReq createUserReq);

}