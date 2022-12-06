part of 'profile_bloc.dart';

abstract class ProfileEvent extends Equatable {
  const ProfileEvent();
}

class BooleadTextEvent extends ProfileEvent {
  final bool isDark;

  const BooleadTextEvent(this.isDark);
  @override
  List<Object?> get props => [];
}
