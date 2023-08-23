import 'package:devera_fitness/pages/phone/widget/custom_step.dart';
import 'package:devera_fitness/widgets/app_button.dart';
import 'package:flutter/material.dart';

import '../../../resources/colors.dart';
import '../widget/widgets.dart';

class StartWorkoutPage extends StatefulWidget {
  const StartWorkoutPage({super.key});

  @override
  State<StartWorkoutPage> createState() => _StartWorkoutPageState();
}

class _StartWorkoutPageState extends State<StartWorkoutPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          fit: StackFit.expand,
          children: [
            SingleChildScrollView(
              padding: EdgeInsets.symmetric(vertical: 40, horizontal: 30),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [CustomAppBar(title: ''), buildVideoTutorial(), buildDescription(), buildHowDoIt()],
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: IntrinsicHeight(
                child: AppButton(
                    borderRadius: BorderRadius.circular(100),
                    padding: EdgeInsets.symmetric(vertical: 18),
                    margin: EdgeInsets.all(30),
                    child: Text(
                      'Save',
                      style: TextStyle(fontWeight: FontWeight.w700, color: AppColors.white, fontSize: 16),
                    )),
              ),
            )
          ],
        ),
      ),
    );
  }

  buildVideoTutorial() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Jumping Jack',
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
          ),
          Text('Easy | 390 Calories Burn', style: TextStyle(fontSize: 12, fontWeight: FontWeight.w400, color: AppColors.grayDark))
        ],
      ),
    );
  }

  buildDescription() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 15),
      child: Column(
        children: [
          AppHeader(title: 'Description'),
          SizedBox(height: 15),
          Text(
            'A jumping jack, also known as a star jump and called a side-straddle hop in the US military, is a physical jumping exercise performed by jumping to a position with the legs spread wide',
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w400,
              color: AppColors.grayDark,
            ),
            maxLines: 4,
            overflow: TextOverflow.ellipsis,
          )
        ],
      ),
    );
  }

  buildHowDoIt() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 15),
      child: Column(
        children: [
          AppHeader(
            title: 'How To Do It',
            subTitle: '4 Steps',
          ),
          ListView.builder(
            itemBuilder: (context, index) {
              return buildStep(currentStep: index, title: 'dsad', subTitle: 'sadsa');
            },
            itemCount: 4,
            shrinkWrap: true,
          )
        ],
      ),
    );
  }

  buildStep({required int currentStep, required String title, required String subTitle}) {
    return Row(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            children: [CustomStep(currentStep: currentStep)],
          ),
        )
      ],
    );
  }
}
