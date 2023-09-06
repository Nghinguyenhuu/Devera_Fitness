import 'package:flutter/material.dart';

import '../../../gen/assets.gen.dart';
import '../../../resources/colors.dart';
import '../../../router/router.dart';
import '../../../widgets/app_button.dart';

class RegisterSuccessPage extends StatefulWidget {
  const RegisterSuccessPage({super.key});

  @override
  State<RegisterSuccessPage> createState() => _RegisterSuccessPageState();
}

class _RegisterSuccessPageState extends State<RegisterSuccessPage> {
  ThemeData get theme => Theme.of(context);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 30),
          child: Column(
            children: [
              Expanded(
                  child: Column(
                // mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 40),
                    child: Assets.images.png.imgRegisterSuccess.image(),
                  ),
                  Text(
                    'Welcome, Stefani',
                    style: theme.textTheme.displayMedium,
                  ),
                  SizedBox(height: 5),
                  Text(
                    'You are all set now, let’s reach your goals together with us',
                    style: theme.textTheme.labelLarge?.copyWith(color: AppColors.grayDark),
                  ),
                ],
              )),
              AppButton(
                  onTap: () {
                    Navigator.pushReplacementNamed(context, Routes.homeTab);
                  },
                  borderRadius: BorderRadius.circular(100),
                  padding: EdgeInsets.symmetric(vertical: 18),
                  child: Text(
                    'Go To Home',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: AppColors.white,
                    ),
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
