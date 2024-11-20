import 'package:dartz/dartz.dart';
import 'package:flutter_bloc_clean_arch_firebase/core/usecase/usecase.dart';
import 'package:flutter_bloc_clean_arch_firebase/domain/repository/auth.dart';
import 'package:flutter_bloc_clean_arch_firebase/service_locator.dart';

class GetUserUseCase implements UseCase<Either,dynamic> {

  @override
  Future<Either> call({params}) async{
    return await sl<AuthRepository>().getUSer();
  }
}