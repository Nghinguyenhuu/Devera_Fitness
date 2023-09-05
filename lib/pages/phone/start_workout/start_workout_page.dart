import 'package:devera_fitness/pages/phone/start_workout/custom_repetitions.dart';
import 'package:flutter/material.dart';

import '../../../gen/assets.gen.dart';
import '../../../resources/colors.dart';
import '../../../widgets/app_button.dart';
import '../widget/custom_step.dart';
import '../widget/widgets.dart';

class StartWorkoutPage extends StatefulWidget {
  const StartWorkoutPage({super.key});

  @override
  State<StartWorkoutPage> createState() => _StartWorkoutPageState();
}

class _StartWorkoutPageState extends State<StartWorkoutPage> {
  List<String> listTitle = [
    'Spread Your Arms',
    'Rest at The Toe',
    'Adjust Foot Movement',
    'Clapping Both Hands',
  ];
  List<String> listSubTitle = [
    'To make the gestures feel more relaxed, stretch your arms as you start this movement. No bending of hands.',
    'The basis of this movement is jumping. Now, what needs to be considered is that you have to use the tips of your feet',
    'Jumping Jack is not just an ordinary jump. But, you also have to pay close attention to leg movements.',
    'This cannot be taken lightly. You see, without realizing it, the clapping of your hands helps you to keep your rhythm while doing the Jumping Jack',
  ];

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
                children: [
                  CustomAppBar(title: ''),
                  buildVideoTutorial(),
                  buildDescription(),
                  buildHowDoIt(),
                  CustomRepetitions(),
                ],
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
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 20),
            child: Assets.images.png.imgWorkoutDetailsVideo.image(fit: BoxFit.cover),
          ),
          Text(
            'Jumping Jack',
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
          ),
          SizedBox(height: 5),
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
          SizedBox(height: 16),
          ListView.builder(
            itemBuilder: (context, index) {
              return CustomStep(
                currentStep: index,
                title: listTitle[index],
                subTitle: listSubTitle[index],
                isDottedLine: index < listTitle.length - 1,
              );
            },
            itemCount: listTitle.length,
            shrinkWrap: true,
          )
        ],
      ),
    );
  }
}
