part of 'my_app_bloc.dart';

abstract class MyAppEvent extends Equatable {
  const MyAppEvent();


}

class ChangeThemeEvent extends MyAppEvent {
  final bool isLightTheme;

  const ChangeThemeEvent(this.isLightTheme);
  @override
  List<Object?> get props => [isLightTheme];
}
