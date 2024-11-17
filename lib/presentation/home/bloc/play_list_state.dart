
import 'package:flutter_bloc_clean_arch_firebase/domain/entities/song/song.dart';

abstract class PlayListState {}

class PlayListLoading extends PlayListState {}

class PlayListLoaded extends PlayListState {
  final List<SongEntity> songs;
  PlayListLoaded({required this.songs});
}

class PlayListLoadFailure extends PlayListState {}