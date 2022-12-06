part of 'my_app_bloc.dart';

abstract class MyAppState extends Equatable {
  const MyAppState();
}

class MyAppInitial extends MyAppState {
  final ThemeData themeData;

  const MyAppInitial(this.themeData);
  @override
  List<Object?> get props => [themeData];
}
