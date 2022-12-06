import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../app/bloc/my_app_bloc.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
                onPressed: () {
                  //
                  BlocProvider.of<MyAppBloc>(context)
                      .add(const ChangeThemeEvent(false));
                },
                child: Text(
                  "Dart mode",
                  style: Theme.of(context).textTheme.headline6,
                )),
            ElevatedButton(
                onPressed: () {
                  BlocProvider.of<MyAppBloc>(context)
                      .add(const ChangeThemeEvent(true));
                },
                child: Text(
                  "Light mode",
                  style: Theme.of(context).textTheme.headline6,
                )),
          ],
        ),
      ),
    );
  }
}
