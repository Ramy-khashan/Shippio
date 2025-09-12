import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:shippio/core/constant/app_colors.dart';
import '../../../../config/router/router_keys.dart';
import '../../../../core/components/app_button.dart';
import '../../../../core/components/app_text_field.dart';

class SignInScreen extends StatelessWidget {
  const SignInScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        child: SafeArea(
          child: SingleChildScrollView(
            padding: EdgeInsets.symmetric(horizontal: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 40),
                  child: Image(
                    image: AssetImage("assets/images/logo.png"),
                    height: 100,
                    width: 200,
                  ),
                ),
                Text.rich(
                  TextSpan(
                    children: [
                      TextSpan(
                        text: "Welcome To\n",
                        style: TextStyle(
                          fontSize: 30,
                          height: 1,
                          fontWeight: FontWeight.w200,
                        ),
                      ),
                      TextSpan(
                        text: "Shippio",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 40,

                          fontWeight: FontWeight.w900,
                        ),
                      ),
                    ],
                  ),
                  textAlign: TextAlign.center,
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 15),
                  child: AppTextField(
                    labelText: "Email",
                    validator: (value) {
                      return null;
                    },

                    controller: TextEditingController(),
                  ),
                ),
                AppTextField(
                  labelText: "Password",
                  validator: (value) {
                    return null;
                  },

                  controller: TextEditingController(),
                ),
                Align(
                  alignment: AlignmentDirectional.centerEnd,
                  child: TextButton(
                    onPressed: () {},
                    child: Text(
                      "Forgot Password?",
                      style: TextStyle(color: AppColors.redColor),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 25),
                  child: AppButton(
                    title: "Sign In",
                    onPressed: () {
                      context.goNamed(RouterKeys.homeScreen);
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
