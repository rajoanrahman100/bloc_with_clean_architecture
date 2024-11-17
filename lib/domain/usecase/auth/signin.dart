import 'package:dartz/dartz.dart';
import 'package:flutter_bloc_clean_arch_firebase/data/model/auth/signin_user_req.dart';
import 'package:flutter_bloc_clean_arch_firebase/domain/repository/auth.dart';
import 'package:flutter_bloc_clean_arch_firebase/service_locator.dart';

import '../../../core/usecase/usecase.dart';

class SigninUseCase implements UseCase<Either, SignInUserReq> {
  @override
  Future<Either> call({SignInUserReq? params}) async {
    return sl<AuthRepository>().signIn(params!);
  }
}
