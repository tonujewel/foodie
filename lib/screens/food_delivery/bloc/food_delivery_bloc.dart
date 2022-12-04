import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:foodie/data/repository/food_delivery_repository.dart';

import '../../../data/model/error_dm.dart';
import '../../../data/model/restaurant_dm.dart';

part 'food_delivery_event.dart';
part 'food_delivery_state.dart';

class FoodDeliveryBloc extends Bloc<FoodDeliveryEvent, FoodDeliveryState> {
  final FoodDeliveryRepository _deliveryRepository;
  int page = 1;
  bool isFetching = false;
  List<RestaurantData> result = [];
  FoodDeliveryBloc(this._deliveryRepository) : super(FoodDeliveryLoading()) {
    on<FoodDeliveryEvent>((event, emit) {});

    on<FetchFoodDelivery>((event, emit) async {
      emit(FoodDeliveryLoading());
      (await _deliveryRepository.getRestaurant(page)).fold((ErrorDm errorDm) {
        emit(FoodDeliveryError("${errorDm.message}"));
      }, (RestaurantDm restaurantData) {
        result = result + (restaurantData.result?.data ?? []);
        emit(FoodDeliveryLoaded(result));
        page++;
      });
    });
  }
}
