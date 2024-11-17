import 'package:flutter_bloc_clean_arch_firebase/data/repository/auth_repository_impl.dart';
import 'package:flutter_bloc_clean_arch_firebase/data/repository/song/song_repository_impl.dart';
import 'package:flutter_bloc_clean_arch_firebase/data/sources/auth/auth_firebase_service.dart';
import 'package:flutter_bloc_clean_arch_firebase/data/sources/songs/song_firebase_service.dart';
import 'package:flutter_bloc_clean_arch_firebase/domain/repository/auth.dart';
import 'package:flutter_bloc_clean_arch_firebase/domain/repository/song/song.dart';
import 'package:flutter_bloc_clean_arch_firebase/domain/usecase/auth/signin.dart';
import 'package:flutter_bloc_clean_arch_firebase/domain/usecase/auth/signup.dart';
import 'package:flutter_bloc_clean_arch_firebase/domain/usecase/song/get_new_songs.dart';
import 'package:flutter_bloc_clean_arch_firebase/domain/usecase/song/get_play_list.dart';
import 'package:get_it/get_it.dart';

final sl = GetIt.instance;

Future<void> initializeDependencies() async {
  sl.registerSingleton<AuthFirebaseService>(AuthFirebaseServiceImpl());
  sl.registerSingleton<AuthFirebaseServiceImpl>(AuthFirebaseServiceImpl());
  sl.registerSingleton<SongFirebaseService>(SongFirebaseServiceImpl());
  sl.registerSingleton<SongFirebaseServiceImpl>(SongFirebaseServiceImpl());
  sl.registerSingleton<AuthRepository>(AuthRepositoryImpl());
  sl.registerSingleton<SongRepository>(SongRepositoryImpl());

  sl.registerSingleton<SignUpUseCase>(SignUpUseCase());
  sl.registerSingleton<SigninUseCase>(SigninUseCase());
  sl.registerSingleton<GetNewsSongsUseCase>(GetNewsSongsUseCase());
  sl.registerSingleton<GetPlayListUseCase>(GetPlayListUseCase());
}
