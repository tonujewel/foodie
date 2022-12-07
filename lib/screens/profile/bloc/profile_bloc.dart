import 'dart:developer';
import 'dart:ui';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/scheduler.dart';
part 'profile_event.dart';
part 'profile_state.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  ProfileBloc() : super(ProfileLoadingState()) {
    on<ProfileEvent>((event, emit) {
      var brightness = SchedulerBinding.instance.window.platformBrightness;
      bool isDarkMode = brightness == Brightness.dark;
      emit(ProfileLoadedState(isDarkMode: isDarkMode));
    });

    on<ProfileThemeChangeEvent>((event, emit) {
      changeThemeAction(event.isDark, emit);
    });
  }

  void changeThemeAction(bool isDark, Emitter<ProfileState> emit) {
    final state = this.state;
    if (state is ProfileLoadedState) {
      emit(ProfileLoadedState(isDarkMode: isDark));
    }
  }
}
