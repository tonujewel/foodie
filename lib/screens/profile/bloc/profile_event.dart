part of 'profile_bloc.dart';

abstract class ProfileEvent extends Equatable {
  const ProfileEvent();
}

class ProfileInitialEvent extends ProfileEvent {
  @override
  List<Object?> get props => [];
}

class ProfileThemeChangeEvent extends ProfileEvent {
  final bool isDark;

  const ProfileThemeChangeEvent({required this.isDark});
  @override
  List<Object?> get props => [];
}
