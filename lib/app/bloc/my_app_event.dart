part of 'my_app_bloc.dart';

abstract class MyAppEvent extends Equatable {
  const MyAppEvent();
}

class ChangeThemeEvent extends MyAppEvent {
  final bool isDarkTheme;

  const ChangeThemeEvent({required this.isDarkTheme});
  @override
  List<Object?> get props => [isDarkTheme];
}
