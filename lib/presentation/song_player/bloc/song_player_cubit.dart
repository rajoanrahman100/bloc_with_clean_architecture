import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_clean_arch_firebase/presentation/song_player/bloc/song_player_state.dart';
import 'package:just_audio/just_audio.dart';

class SongPlayerCubit extends Cubit<SongPlayerState> {

  AudioPlayer audioPlayer = AudioPlayer();

  Duration songDuration = Duration.zero;
  Duration songPosition = Duration.zero;

  SongPlayerCubit() : super(SongPlayerLoading()){

    audioPlayer.positionStream.listen((position) {
      songPosition = position;
      updateSongPlayer();
    });

    audioPlayer.durationStream.listen((duration) {
      songDuration = duration!;
    });
  }

  void updateSongPlayer(){
    emit(SongPlayerLoaded());
  }

  //Instantiate the audio player


  Future<void> loadSong(String url) async {
    // Pass the url of the song
    try {
      await audioPlayer.setUrl(url);
      emit(SongPlayerLoaded());
    } catch (e) {
      emit(SongPlayerFailure());
    }
  }

  void playOrPauseSong() async {
    if (audioPlayer.playing) {
      await audioPlayer.pause();
    } else {
      await audioPlayer.play();
    }

    emit(SongPlayerLoaded());
  }

  @override
  Future<void> close() {
    // TODO: implement close
    audioPlayer.dispose();
    return super.close();
  }
}
