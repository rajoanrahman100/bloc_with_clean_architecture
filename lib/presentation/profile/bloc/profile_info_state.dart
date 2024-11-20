import 'package:flutter_bloc_clean_arch_firebase/domain/entities/auth/user.dart';

abstract class ProfileInfoState{}

class ProfileInfoLoading extends ProfileInfoState{}
class ProfileInfoLoaded extends ProfileInfoState{
  UserEntity? userEntity;
  ProfileInfoLoaded({this.userEntity});
}
class ProfileInfoError extends ProfileInfoState{}