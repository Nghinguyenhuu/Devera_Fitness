import 'package:flutter/material.dart';
import 'package:rxdart/rxdart.dart';

import '../../../gen/assets.gen.dart';
import '../../../resources/colors.dart';
import '../../../resources/gradient.dart';
import '../../../router/router.dart';
import '../../../widgets/app_button.dart';
import '../../../widgets/app_text_field.dart';
import '../../../widgets/ink_well_wrapper.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  ThemeData get theme => Theme.of(context);
  final GlobalKey<FormState> _key = GlobalKey();
  BehaviorSubject<bool?> errorStream = BehaviorSubject.seeded(false);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                'Hey there,',
                style: theme.textTheme.labelLarge,
                textAlign: TextAlign.center,
              ),
              Text(
                'Welcome Back',
                style: theme.textTheme.bodyLarge?.copyWith(fontWeight: FontWeight.w700),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 30),
              Expanded(
                child: Form(
                  key: _key,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      buildTextField(prefixPath: Assets.images.svg.icMessage, hint: 'Email'),
                      buildTextField(prefixPath: Assets.images.svg.icLock, hint: 'Password', isPassword: true),
                      StreamBuilder<bool?>(
                          stream: errorStream,
                          builder: (context, snapshot) {
                            if (snapshot.hasData && snapshot.data == true) {
                              return Text(
                                'Please fill the entry form',
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400,
                                  color: Colors.red,
                                ),
                              );
                            }
                            return SizedBox();
                          }),
                      InkWellWrapper(
                          onTap: () {
                            ///TODO: navigator to forgot password
                          },
                          child: Text(
                            'Forgot your password?',
                            style: TextStyle(
                              fontSize: 12,
                              color: AppColors.gray,
                              decoration: TextDecoration.underline,
                            ),
                            textAlign: TextAlign.center,
                          )),
                    ],
                  ),
                ),
              ),
              AppButton(
                onTap: () {
                  if (_key.currentState?.validate() == true) {
                    errorStream.add(false);
                    Navigator.of(context).pushReplacementNamed(Routes.home);
                  } else {
                    errorStream.add(true);
                  }
                },
                borderRadius: BorderRadius.circular(100),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Assets.images.svg.icLogin.svg(),
                    SizedBox(width: 10),
                    Text(
                      'Login',
                      style: theme.textTheme.bodySmall?.copyWith(fontWeight: FontWeight.w600, color: AppColors.white),
                    ),
                  ],
                ),
                padding: EdgeInsets.symmetric(vertical: 18),
              ),
              buildOrContent(),
              buildGoogleAndFacebook(),
              SizedBox(height: 30),
              buildLoginAccount()
            ],
          ),
        ),
      ),
    );
  }

  Widget buildTextField({required SvgGenImage prefixPath, required String hint, bool isPassword = false}) {
    return AppTextField(
      prefixIcon: prefixPath.svg(
        width: 18,
        height: 18,
        color: AppColors.grayDark,
        fit: BoxFit.cover,
      ),
      isPassword: isPassword,
      hintText: hint,
    );
  }

  Widget buildOrContent() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
              child: Container(
            height: 1,
            color: AppColors.grayLight,
          )),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Text(
              'Or',
              style: theme.textTheme.labelMedium,
            ),
          ),
          Expanded(
              child: Container(
            height: 1,
            color: AppColors.grayLight,
          )),
        ],
      ),
    );
  }

  Widget buildGoogleAndFacebook() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        InkWellWrapper(
          onTap: () {},
          border: Border.all(color: AppColors.grayLight),
          borderRadius: BorderRadius.circular(15),
          paddingChild: EdgeInsets.all(15),
          child: Assets.images.png.icGoogle.image(width: 20, height: 20, fit: BoxFit.cover),
        ),
        SizedBox(width: 30),
        InkWellWrapper(
          onTap: () {},
          border: Border.all(color: AppColors.grayLight),
          borderRadius: BorderRadius.circular(15),
          paddingChild: EdgeInsets.all(15),
          child: Assets.images.svg.icFacebook.svg(width: 20, height: 20, fit: BoxFit.cover),
        ),
      ],
    );
  }

  Widget buildLoginAccount() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "Don't have an account yet?",
          style: theme.textTheme.labelLarge,
        ),
        InkWellWrapper(
          onTap: () {
            Navigator.pushReplacementNamed(context, Routes.signUp);
          },
          child: Text(
            ' Register',
            style: theme.textTheme.labelLarge?.copyWith(color: AppColors.secondaryDark),
          ),
        ),
      ],
    );
  }
}
