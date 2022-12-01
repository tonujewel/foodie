part of 'base_bloc.dart';

abstract class BaseEvent extends Equatable {
  const BaseEvent();
}

class BaseInitialEvent extends BaseEvent {
  @override
  List<Object?> get props => [];
}

class BottomNavigationClickEvent extends BaseEvent {
  final int index;

  const BottomNavigationClickEvent(this.index);
  @override
  List<Object?> get props => [index];
}
