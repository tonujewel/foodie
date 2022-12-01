import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
part 'base_event.dart';
part 'base_state.dart';

class BaseBloc extends Bloc<BaseEvent, BaseState> {
  BaseBloc() : super(const BaseInitialState("Explore")) {
    on<BaseInitialEvent>((event, emit) {
      emit(const ExploreState("Explore"));
    });

    on<BottomNavigationClickEvent>((event, emit) {
      log("${event.index}");
      if (event.index == 0) {
        emit(const ExploreState("Explore"));
      }
      if (event.index == 1) {
        emit(const HistoryState("History"));
      }
      if (event.index == 2) {
        emit(const SavedState("Saved"));
      }
      if (event.index == 3) {
        emit(const ProfileState("Profile"));
      }
    });
  }
}
