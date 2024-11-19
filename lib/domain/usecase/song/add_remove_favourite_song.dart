import 'package:dartz/dartz.dart';
import 'package:flutter_bloc_clean_arch_firebase/core/usecase/usecase.dart';
import 'package:flutter_bloc_clean_arch_firebase/service_locator.dart';

import '../../repository/song/song.dart';

class AddRemoveFavouriteSongUseCase implements UseCase<Either,String> {

  @override
  Future<Either> call({String? params}) async{
    return await sl<SongRepository>().addOrRemoveFavouriteSong(params!);
  }
}