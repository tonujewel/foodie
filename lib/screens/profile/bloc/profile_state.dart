part of 'profile_bloc.dart';

abstract class ProfileState extends Equatable {
  const ProfileState();
}

class ProfileLoadingState extends ProfileState{
  @override
  List<Object?> get props => [];
}

class ProfileLoadedState extends ProfileState {
  String? text;
  final bool isDarkMode;

  ProfileLoadedState({
    this.text,
    required this.isDarkMode,
  });

  @override
  List<Object?> get props => [text, isDarkMode];
}
