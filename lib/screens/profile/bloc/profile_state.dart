part of 'profile_bloc.dart';

abstract class ProfileState extends Equatable {
  const ProfileState();
}

class ProfileInitial extends ProfileState {
  String? text;

  ProfileInitial({this.text});

  @override
  List<Object?> get props => [text];
}

class ProfileThemeChangeState extends ProfileState {
  final bool isDark;

  const ProfileThemeChangeState(this.isDark);
  @override
  List<Object?> get props => [isDark];
}
