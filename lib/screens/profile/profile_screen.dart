import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../app/bloc/my_app_bloc.dart';
import 'bloc/profile_bloc.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (context) => ProfileBloc()..add(ProfileInitialEvent()),
        child: BlocBuilder<ProfileBloc, ProfileState>(
          builder: (context, state) {
      

            if (state is ProfileLoadingState) {
              return const CircularProgressIndicator();
            }

            if (state is ProfileLoadedState) {
              return Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
                child: Center(
                  child: Column(
                    children: [
                      Card(
                        child: Row(
                          children: [
                            const SizedBox(
                              width: 10,
                            ),
                            const Text(
                              "Dark mode",
                            ),
                            const Spacer(),
                            Switch(
                                value: state.isDarkMode,
                                onChanged: (val) {

                                  // switch
                                  BlocProvider.of<ProfileBloc>(context).add(
                                      ProfileThemeChangeEvent(isDark: val));
                                  // theme change
                                  BlocProvider.of<MyAppBloc>(context)
                                      .add(ChangeThemeEvent(isDarkTheme: val));
                                })
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              );
            }

            return const Text("Something went wrong");
          },
        ),
      ),
    );
  }
}
