part of 'home_bloc.dart';

abstract class HomeEvent extends Equatable {
  const HomeEvent();
}

class LoadRestaurantDataEvent extends HomeEvent {
  @override
  List<Object> get props => [];
}

class BottomNavigationClickEvent extends HomeEvent {
  final int index;

  const BottomNavigationClickEvent(this.index);
  @override
  List<Object?> get props => [index];
}
