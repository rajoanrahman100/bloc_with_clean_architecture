import 'package:dartz/dartz.dart';
import 'package:flutter_bloc_clean_arch_firebase/domain/repository/song/song.dart';
import 'package:flutter_bloc_clean_arch_firebase/service_locator.dart';

import '../../sources/songs/song_firebase_service.dart';

class SongRepositoryImpl implements SongRepository {
  @override
  Future<Either> getNewSongs() async{
    // TODO: implement getNewSongs
    return await sl<SongFirebaseService>().getNewSongs();
  }

  @override
  Future<Either> getPlayList() async{
    // TODO: implement getPlayList
    return await sl<SongFirebaseService>().getPlayList();
  }

}