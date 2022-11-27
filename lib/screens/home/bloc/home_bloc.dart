import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:foodie/data/model/error_dm.dart';
import 'package:foodie/data/model/restaurant_dm.dart';
import 'package:foodie/data/model/user_dm.dart';
import 'package:foodie/data/repository/restaurant_repository.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final RestaurantRepository _repository;

  HomeBloc(this._repository) : super(HomeLoadingState()) {
    on<LoadRestaurantDataEvent>((event, emit) async {
      emit(HomeLoadingState());

        // final restaurantData = await _repository.getJoke();
        // log("try $restaurantData");
        // emit(HomeLoadedState(restaurantData.result?.data ?? []));

        (await _repository.loginApiCall()).fold((ErrorDm errorDm) {
          //error
          log("errors ${errorDm.message}");
        }, (UserDm userDm) {
          // success
          log("successs ${userDm.data?.firstName}");
        });
     
    });
  }
}
