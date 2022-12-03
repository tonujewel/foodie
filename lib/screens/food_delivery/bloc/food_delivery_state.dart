part of 'food_delivery_bloc.dart';

abstract class FoodDeliveryState extends Equatable {
  const FoodDeliveryState();
}

class FoodDeliveryLoading extends FoodDeliveryState {
  @override
  List<Object> get props => [];
}

class FoodDeliveryLoaded extends FoodDeliveryState {
  final List<RestaurantData> restaurantList;

  const FoodDeliveryLoaded(this.restaurantList);
  @override
  List<Object?> get props => [restaurantList];
}

class FoodDeliveryError extends FoodDeliveryState {
  final String msg;

  const FoodDeliveryError(this.msg);
  @override
  List<Object> get props => [msg];
}
