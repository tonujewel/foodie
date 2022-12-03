part of 'food_delivery_bloc.dart';

abstract class FoodDeliveryEvent extends Equatable {
  const FoodDeliveryEvent();
}

class FetchFoodDelivery extends FoodDeliveryEvent {
  @override
  List<Object> get props => [];
}
