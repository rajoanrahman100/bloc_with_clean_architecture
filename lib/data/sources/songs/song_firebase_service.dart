import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_bloc_clean_arch_firebase/data/model/song/song.dart';
import 'package:flutter_bloc_clean_arch_firebase/domain/entities/song/song.dart';

abstract class SongFirebaseService {
  Future<Either> getNewSongs();
  Future<Either> getPlayList();
}

class SongFirebaseServiceImpl implements SongFirebaseService {
  @override
  Future<Either> getNewSongs() async {
    // TODO: implement getNewSongs

    try {
      List<SongEntity> songs = [];

      var data =
          await FirebaseFirestore.instance.collection("Songs").orderBy('releaseDate', descending: true).limit(3).get();

      for (var element in data.docs) {
        var songModel = SongModel.fromJson(element.data());
        songs.add(songModel.toEntity());
      }

      return Right(songs);
    } catch (e) {
      return Left("An error occurd while getting new songs ${e.toString()}");
    }
  }

  @override
  Future<Either> getPlayList()async {
    // TODO: implement getPlayList
    try {
      List < SongEntity > songs = [];
      var data = await FirebaseFirestore.instance.collection('Songs')
          .orderBy('releaseDate', descending: true)
          .get();

      for (var element in data.docs) {
        var songModel = SongModel.fromJson(element.data());
        // bool isFavorite = await sl<IsFavoriteSongUseCase>().call(
        //     params: element.reference.id
        // );
       // songModel.isFavorite = isFavorite;
        songModel.songId = element.reference.id;
        songs.add(
            songModel.toEntity()
        );
      }

      return Right(songs);

    } catch (e) {
      print(e);
      return const Left('An error occurred, Please try again.');
    }
  }
}