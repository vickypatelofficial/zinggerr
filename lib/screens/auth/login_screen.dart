import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:zinggerr/blocs/login/login_bloc.dart';
import 'package:zinggerr/blocs/login/login_event.dart';
import 'package:zinggerr/blocs/login/login_state.dart';
import 'package:zinggerr/config/app_asset.dart';
import 'package:zinggerr/config/app_colors.dart';
import 'package:zinggerr/config/app_text.dart';
import 'package:zinggerr/main.dart';
import 'package:zinggerr/screens/auth/forgot_password_screen.dart';
import 'package:zinggerr/screens/auth/sign_up_screen.dart';
import 'package:zinggerr/screens/bottom_bar_screen.dart';
import 'package:zinggerr/utils/ui_helper.dart';
import 'package:zinggerr/widgets/custom_buton.dart';
import 'package:zinggerr/widgets/custom_scaffold.dart';
import 'package:zinggerr/widgets/custom_status_bar_widget.dart';
import 'package:zinggerr/widgets/custom_text_field.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return StatusBarCustom(
        child: CustomScaffold(
      child: Center(
        child: Container(
          // padding: const EdgeInsets.all(20),
          margin: EdgeInsets.symmetric(horizontal: screenWidth * .05),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Image.asset(AppAssets.logo, height: 60),
              UIHelpers.verticalSpace(20),
              Text(AppTexts.welcome,
                  style: Theme.of(context)
                      .textTheme
                      .titleLarge!
                      .copyWith(color: AppColors.primaryColor)),
              UIHelpers.verticalSpace(10),
              Text(AppTexts.loginSubtitle,
                  style: Theme.of(context).textTheme.bodySmall),
              UIHelpers.verticalSpace(30),
              CustomTextFormWidget(
                hintText: AppTexts.emailHint,
                controller: emailController,
                validator: (value) => value!.isEmpty ? 'Enter email' : null,
              ),
              UIHelpers.verticalSpace(15),
              BlocBuilder<LoginBloc, LoginState>(
                builder: (context, state) {
                  return CustomTextFormWidget(
                    hintText: 'Password',
                    isObs: !state.isPasswordVisible,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter password';
                      }
                      return null;
                    },
                    onChanged: (val) {
                      context.read<LoginBloc>().add(PasswordChanged(val!));
                    },
                    suffixWidget: InkWell(
                      onTap: () {
                        context.read<LoginBloc>().add(PasswordVisibilityChanged(
                            !state.isPasswordVisible));
                      },
                      child: Icon(
                        state.isPasswordVisible
                            ? Icons.visibility_outlined
                            : Icons.visibility_off,
                      ),
                    ),
                  );
                },
              ),
              UIHelpers.verticalSpace(10),
              Row(
                children: [
                  Checkbox(
                    value: true,
                    onChanged: (value) {},
                    fillColor:
                        const WidgetStatePropertyAll(AppColors.primaryColor),
                  ),
                  Text(AppTexts.rememberMe,
                      style: Theme.of(context).textTheme.bodySmall),
                  const Spacer(),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                        return ForgotPasswordScreen();
                      }));
                    },
                    child: Text(AppTexts.forgotPassword,
                        style: Theme.of(context)
                            .textTheme
                            .bodySmall!
                            .copyWith(color: AppColors.primaryColor)),
                  )
                ],
              ),
              UIHelpers.verticalSpace(10),
              CustomButton(
                text: AppTexts.login,
                ontap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return const BottomNavScreen();
                  }));
                },
              ),
              UIHelpers.verticalSpace(10),
              GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return SignUpScreen();
                  }));
                },
                child: Text(AppTexts.dontHaveAccount,
                    style: Theme.of(context)
                        .textTheme
                        .bodySmall!
                        .copyWith(color: AppColors.primaryColor)),
              )
            ],
          ),
        ),
      ),
    ));
  }
}
