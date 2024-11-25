import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_clean_arch_firebase/domain/usecase/song/get_new_songs.dart';
import 'package:flutter_bloc_clean_arch_firebase/presentation/home/bloc/new_songs_state.dart';
import 'package:flutter_bloc_clean_arch_firebase/service_locator.dart';

class NewSongsCubit extends Cubit<NewSongsState> {
  NewSongsCubit() : super(NewSongsLoading());

  Future<void> getNewSongs() async {
    var result = await sl<GetNewsSongsUseCase>().call();

    result.fold((left) {
      emit(NewSongsLoadingFailure());
    }, (right) {
      emit(NewSongsLoaded(songs: right));
    });
  }
}
