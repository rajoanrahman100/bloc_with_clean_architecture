import 'package:dartz/dartz.dart';
import 'package:flutter_bloc_clean_arch_firebase/core/usecase/usecase.dart';
import 'package:flutter_bloc_clean_arch_firebase/domain/repository/song/song.dart';
import 'package:flutter_bloc_clean_arch_firebase/service_locator.dart';

class IsFavouriteSongUseCase implements UseCase<bool,String> {

  @override
  Future<bool> call({String? params}) async{
    return await sl<SongRepository>().isFavouriteSong(params!);
  }
}