import 'package:rxdart/rxdart.dart';

import '../../../resources/resources.dart';
import '../../../widgets/app_text_field.dart';
import '../../../widgets/custom_date_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../../gen/assets.gen.dart';
import '../../../widgets/app_button.dart';
import '../../../widgets/app_drop_down.dart';

class RegisterProfilePage extends StatefulWidget {
  const RegisterProfilePage({super.key});

  @override
  State<RegisterProfilePage> createState() => _RegisterProfilePageState();
}

class _RegisterProfilePageState extends State<RegisterProfilePage> {

  BehaviorSubject<bool?> errorStream = BehaviorSubject.seeded(false);
  final GlobalKey<FormState> _globalKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(vertical: 40, horizontal: 30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Center(child: Assets.images.png.imgRegisterProfile.image(fit: BoxFit.fill)),
              SizedBox(height: 30),
              Text(
                "Let’s complete your profile",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w700,
                ),
              ),
              SizedBox(height: 5),
              Text(
                'It will help us to know more about you!',
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                  color: AppColors.grayDark,
                ),
              ),
              buildInfo(),
              AppButton(
                padding: EdgeInsets.symmetric(vertical: 16),
                borderRadius: BorderRadius.circular(100),
                onTap: (){
                  if(_globalKey.currentState?.validate() == true){
                    errorStream.add(false);
                    // Navigator.of(context).pushNamed(routeName);
                  }else{
                    errorStream.add(true);
                  }
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Next',
                      style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16, color: AppColors.white),
                    ),
                    Assets.images.svg.icCheveronRignt.svg(width: 20, height: 20, color: AppColors.white)
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget buildInfo() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 30),
      child: Form(
        key: _globalKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            AppDropdownButton(
              onChange: (String value) {},
              hint: 'Choose Gender',
              icon: Assets.images.svg.icDropdown.svg(width: 18, height: 18, color: AppColors.grayDark),
              prefixIcon: Assets.images.svg.ic2User.svg(width: 18, height: 18, color: AppColors.grayDark),
              items: ["Male", "Female", "Other"],
            ),
            CustomDatePicker(hint: 'Date of birth'),
            Row(
              children: [
                Expanded(
                  child: AppTextField(
                    prefixIcon: Assets.images.svg.icWeight.svg(width: 18, height: 18, color: AppColors.grayDark),
                    inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                    hintText: 'Your Weight',
                  ),
                ),
                SizedBox(width: 16),
                Container(
                  width: 48,
                  height: 48,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(gradient: AppGradient.purpleGradient, borderRadius: BorderRadius.circular(12)),
                  child: Text(
                    'KG',
                    style: Theme.of(context).textTheme.labelMedium?.copyWith(color: AppColors.white),
                  ),
                )
              ],
            ),
            Row(
              children: [
                Expanded(
                  child: AppTextField(
                    prefixIcon: Assets.images.svg.icSwap.svg(width: 18, height: 18, color: AppColors.grayDark),
                    inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                    hintText: 'Your Height',
                  ),
                ),
                SizedBox(width: 16),
                Container(
                  width: 48,
                  height: 48,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(gradient: AppGradient.purpleGradient, borderRadius: BorderRadius.circular(12)),
                  child: Text(
                    'CM',
                    style: Theme.of(context).textTheme.labelMedium?.copyWith(color: AppColors.white),
                  ),
                )
              ],
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
          ],
        ),
      ),
    );
  }
}
