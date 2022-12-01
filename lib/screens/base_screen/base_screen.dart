import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foodie/resources/color_manager.dart';
import 'package:foodie/screens/history/history_screen.dart';
import 'package:foodie/screens/home/home_screen.dart';
import 'package:foodie/screens/profile/profile_screen.dart';
import 'package:foodie/screens/saved/saved_screen.dart';
import 'package:foodie/widgets/bottom_navigation.dart';

import 'bloc/base_bloc.dart';

class BaseScreen extends StatelessWidget {
  const BaseScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => BaseBloc()..add(BaseInitialEvent()),
      child: BlocBuilder<BaseBloc, BaseState>(
        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(
              title: Text(state.title),
              elevation: 0,
            ),
            bottomNavigationBar: BottomNavigation(
              ontap: (value) {
                log("clicke $value");
                BlocProvider.of<BaseBloc>(context)
                    .add(BottomNavigationClickEvent(value));
              },
            ),
            backgroundColor: ColorManager.backgroundColor,
            body: state is ExploreState
                ? const HomeScreen()
                : state is HistoryState
                    ? const HistoryScreen()
                    : state is SavedState
                        ? const SavedScreen()
                        : state is ProfileState
                            ? const ProfileScreen()
                            : Text(state.title),
          );
        },
      ),
    );
  }
}
