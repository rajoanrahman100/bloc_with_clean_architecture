import 'package:dartz/dartz.dart';
import 'package:flutter_bloc_clean_arch_firebase/data/model/auth/create_user_req.dart';
import 'package:flutter_bloc_clean_arch_firebase/data/model/auth/signin_user_req.dart';
import 'package:flutter_bloc_clean_arch_firebase/data/sources/auth/auth_firebase_service.dart';
import 'package:flutter_bloc_clean_arch_firebase/domain/repository/auth.dart';
import 'package:flutter_bloc_clean_arch_firebase/service_locator.dart';

class AuthRepositoryImpl extends AuthRepository {
  @override
  Future<Either> signIn(SignInUserReq signinUserReq) async {
    return await sl<AuthFirebaseServiceImpl>().signIn(signinUserReq);
  }

  @override
  Future<Either> signUp(CreateUserReq createUserReq) async {
    return await sl<AuthFirebaseServiceImpl>().signUp(createUserReq);
  }

  @override
  Future<Either> getUSer() async{
    // TODO: implement getUSer
    return await sl<AuthFirebaseServiceImpl>().getUSer();
  }
}
