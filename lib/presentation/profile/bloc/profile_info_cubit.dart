import 'package:flutter_bloc_clean_arch_firebase/domain/usecase/auth/getUser.dart';
import 'package:flutter_bloc_clean_arch_firebase/presentation/profile/bloc/profile_info_state.dart';
import 'package:flutter_bloc_clean_arch_firebase/service_locator.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';

class ProfileInfoCubit extends Cubit<ProfileInfoState> {
  ProfileInfoCubit() : super(ProfileInfoLoading());

  Future<void> getUser() async {
    var result = await sl<GetUserUseCase>().call();

    result.fold((left) {
      emit(ProfileInfoError());
    }, (userEntity) {
      emit(ProfileInfoLoaded(userEntity: userEntity));
    });
  }
}
