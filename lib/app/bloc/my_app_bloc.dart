import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:foodie/main.dart';
import 'package:foodie/resources/app_prefs.dart';
import '../../data/repository/my_app_repositoty.dart';
part 'my_app_event.dart';
part 'my_app_state.dart';

class MyAppBloc extends Bloc<MyAppEvent, MyAppState> {
  final MyAppRepository _repository;
  MyAppBloc(this._repository) : super(MyAppInitial(_repository.getTheme())) {
    on<MyAppEvent>((event, emit) {});

    on<ChangeThemeEvent>((event, emit) async {
      log("message ${event.isDarkTheme}");
      // await prefs?.setBool("Theme", event.isDarkTheme);

      await AppPreferences.setTheme(event.isDarkTheme);

      emit(MyAppInitial(_repository.getTheme()));
    });
  }
}
