import 'package:dartz/dartz.dart';

abstract class SongRepository {
  Future<Either> getNewSongs();
  Future<Either> getPlayList();
  Future<Either> addOrRemoveFavouriteSong(String songId);
  Future<bool> isFavouriteSong(String songId);
}