part of 'base_bloc.dart';

abstract class BaseState extends Equatable {
  const BaseState(this.title);

  final String title;
}

class BaseInitialState extends BaseState {
  const BaseInitialState(super.title);

  @override
  List<Object> get props => [];
}

class ExploreState extends BaseState {
  const ExploreState(super.title);
  @override
  List<Object> get props => [title];
}

class HistoryState extends BaseState {
  const HistoryState(super.title);

  @override
  List<Object> get props => [title];
}

class SavedState extends BaseState {
  const SavedState(super.title);
  @override
  List<Object> get props => [title];
}

class ProfileState extends BaseState {
  const ProfileState(super.title);


  @override
  List<Object> get props => [title];
}
