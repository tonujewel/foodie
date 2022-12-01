import 'dart:developer';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foodie/data/repository/login_repository.dart';
import 'package:foodie/resources/color_manager.dart';
import 'package:foodie/screens/home/home_screen.dart';
import 'package:foodie/utils/helper.dart';
import '../../widgets/custom_button.dart';
import '../../widgets/custom_text_field.dart';
import 'bloc/login_bloc.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  var emailController = TextEditingController();
  var passwordController = TextEditingController();

  @override
  void initState() {
    if (kDebugMode) {
      emailController.text = "tonujewel@gmail.com";
      passwordController.text = "123456";
    }

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.backgroundColor,
      body: BlocProvider(
        create: (context) =>
            LoginBloc(RepositoryProvider.of<LoginRepository>(context))
              ..add(RegisterServiceEvents()),
        child: BlocConsumer<LoginBloc, LoginState>(
          listener: (context, state) {
            log("$state");

            if (state is LoginLoadingState) {
              AppHelper.loadingDialog(context: context);
            }

            if (state is LoginErrorState) {
              Navigator.pop(context);
              AppHelper.warningDialog(context: context, text: state.error);
            }
            if (state is LoginValidationErrorState) {
              AppHelper.warningDialog(context: context, text: state.error);
            }
            if (state is LoginSuccessState) {
              Navigator.pop(context);
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => const HomeScreen(),
                ),
              );
            }
          },
          builder: (context, state) {
            return Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset('assets/images/logo.png'),
                  const SizedBox(height: 40),
                  CustomTextField(
                    hint: "Email",
                    controller: emailController,
                  ),
                  const SizedBox(height: 20),
                  CustomTextField(
                    hint: "Password",
                    controller: passwordController,
                    obscure: true,
                  ),
                  const SizedBox(height: 20),
                  CustomButton(
                    onTap: () {
                      BlocProvider.of<LoginBloc>(context).add(DoLoginEvent(
                          emailController.text, passwordController.text));
                    },
                    text: 'Login',
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
