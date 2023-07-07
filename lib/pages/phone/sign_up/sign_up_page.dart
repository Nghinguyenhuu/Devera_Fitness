import 'package:rxdart/rxdart.dart';

import '../../../router/router.dart';
import '../../../widgets/ink_well_wrapper.dart';
import '../../../widgets/app_button.dart';
import '../../../widgets/app_text_field.dart';
import 'package:flutter/material.dart';

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
  BehaviorSubject<bool?> errorStream = BehaviorSubject.seeded(false);

  @override
  void dispose() {
    errorStream.close();
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
                SizedBox(height: 150),
                Assets.images.svg.icGoogle.svg(),
                AppButton(
                  onTap: () {
                    if(_formKey.currentState?.validate() == true){
                      errorStream.add(false);
                        Navigator.of(context).pushReplacementNamed(Routes.registerProfile);
                    }else{
                      errorStream.add(true);
                    }
                  },
                  borderRadius: BorderRadius.circular(100),
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
