import '../../../widgets/ink_well_wrapper.dart';
import '../../../widgets/app_button.dart';
import '../../../widgets/app_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../../gen/assets.gen.dart';
import '../../../resources/resources.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  ThemeData get theme => Theme.of(context);
  final GlobalKey<FormState> _formKey = GlobalKey();

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
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
                  'Create an Account',
                  style: theme.textTheme.bodyLarge?.copyWith(fontWeight: FontWeight.w700),
                  textAlign: TextAlign.center,
                ),
                Form(
                  key: _formKey,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      buildTextField(prefixPath: Assets.images.svg.icProfile, hint: 'First Name'),
                      buildTextField(prefixPath: Assets.images.svg.icProfile, hint: 'Last Name'),
                      buildTextField(prefixPath: Assets.images.svg.icMessage, hint: 'Email'),
                      buildTextField(prefixPath: Assets.images.svg.icLock, hint: 'Password', isPassword: true),
                    ],
                  ),
                ),
                SizedBox(height: 150),
                Assets.images.svg.icGoogle.svg(),
                AppButton(
                  onTap: () {
                    // if(_formKey.currentState?.validate() == true){
                    //   ///TODO: Navigator to login page
                    // }
                  },
                  borderRadius: BorderRadius.circular(100),
                  margin: EdgeInsets.symmetric(vertical: 10),
                  child: Text(
                    'Register',
                    style: theme.textTheme.bodySmall?.copyWith(fontWeight: FontWeight.w600, color: AppColors.white),
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
      inputFormatters: [isPassword ? FilteringTextInputFormatter.digitsOnly : FilteringTextInputFormatter.allow(RegExp(r'[a-zA-Z ]'))],
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
          'Already have an account? ',
          style: theme.textTheme.labelLarge,
        ),
        InkWellWrapper(
          onTap: () {},
          child: Text(
            'Login',
            style: theme.textTheme.labelLarge?.copyWith(
              foreground: Paint()
                ..shader = AppGradient.purpleGradient.createShader(
                  Rect.fromLTWH(0, 0, 20, 24),
                ),
            ),
          ),
        ),
      ],
    );
  }
}
