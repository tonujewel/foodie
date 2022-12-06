import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

import '../../config/theme.dart';
import '../../data/repository/my_app_repositoty.dart';

part 'my_app_event.dart';
part 'my_app_state.dart';

class MyAppBloc extends Bloc<MyAppEvent, MyAppState> {
  final MyAppRepository _repository;
  MyAppBloc(this._repository) : super(MyAppInitial(AppThemes.darkTheme)) {
    on<MyAppEvent>((event, emit) {});

    on<ChangeThemeEvent>((event, emit) {
      emit(MyAppInitial(_repository.getTheme(event.isLightTheme)));
    });
  }
}
