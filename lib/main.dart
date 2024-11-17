import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_clean_arch_firebase/core/configs/theme/app_theme.dart';
import 'package:flutter_bloc_clean_arch_firebase/presentation/home/bloc/new_songs_cubit.dart';
import 'package:flutter_bloc_clean_arch_firebase/presentation/home/bloc/play_list_cubit.dart';
import 'package:flutter_bloc_clean_arch_firebase/presentation/splash/pages/splash.dart';
import 'package:flutter_bloc_clean_arch_firebase/service_locator.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:path_provider/path_provider.dart';

import 'firebase_options.dart';
import 'presentation/choose_mode/bloc/theme_cubit.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  HydratedBloc.storage = await HydratedStorage.build(
    storageDirectory: kIsWeb ? HydratedStorage.webStorageDirectory : await getApplicationDocumentsDirectory(),
  );
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  await initializeDependencies();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => ThemeCubit()),
        BlocProvider(create: (_) => NewSongsCubit()),
        BlocProvider(create: (_) => PlayListCubit()),
      ],
      child: BlocBuilder<ThemeCubit, ThemeMode>(builder: (context, mode) {
        return MaterialApp(
          title: 'Flutter Demo',
          theme: AppTheme.lightTheme,
          darkTheme: AppTheme.darkTheme,
          themeMode: mode,
          debugShowCheckedModeBanner: false,
          home: const SplashPage(),
        );
      }),
    );
  }
}
