import 'package:flutter/material.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';

class ThemeCubit extends HydratedCubit<ThemeMode> {
  ThemeCubit() : super(ThemeMode.system);

  void updateTheme(ThemeMode themeMode) {
    print("Theme Mode: $themeMode");
    emit(themeMode);
  }

  @override
  ThemeMode? fromJson(Map<String, dynamic> json) {
    // TODO: implement fromJson
    return null;
  }

  @override
  Map<String, dynamic>? toJson(ThemeMode state) {
    // TODO: implement toJson
    return null;
  }
}
