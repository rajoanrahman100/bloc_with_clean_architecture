import 'package:dartz/dartz.dart';
import 'package:flutter_bloc_clean_arch_firebase/core/usecase/usecase.dart';
import 'package:flutter_bloc_clean_arch_firebase/data/model/auth/create_user_req.dart';
import 'package:flutter_bloc_clean_arch_firebase/domain/repository/auth.dart';
import 'package:flutter_bloc_clean_arch_firebase/service_locator.dart';

///Either class has two prompts.
///Right-> When the operation is successful
///Left-> When the operation fails

class SignUpUseCase implements UseCase<Either, CreateUserReq> {
  @override
  Future<Either> call({CreateUserReq? params}) {
    // TODO: implement call
    return sl<AuthRepository>().signUp(params!);
  }
}
