part of 'home_bloc.dart';

abstract class HomeState extends Equatable {}

class HomeLoadingState extends HomeState {
  @override
  List<Object?> get props => [];
}

class HomeLoadedState extends HomeState {
  List<RestaurantData> restaurantList = [];

  HomeLoadedState(this.restaurantList);
  @override
  List<Object?> get props => [restaurantList];
}

class HomeErrorState extends HomeState {
  final String error;

  HomeErrorState(this.error);

  @override
  List<Object?> get props => [error];
}
