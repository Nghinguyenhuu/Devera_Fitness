import 'package:flutter/material.dart';

import '../../../gen/assets.gen.dart';
import '../../../resources/resources.dart';
import '../../../widgets/app_button.dart';
import '../../pages.dart';

class ProgressPhoto extends StatefulWidget {
  const ProgressPhoto({super.key});

  @override
  State<ProgressPhoto> createState() => _ProgressPhotoState();
}

class _ProgressPhotoState extends State<ProgressPhoto> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child: Column(
                  children: [
                    CustomAppBar(
                      title: 'Progress Photo',
                      hasPopContext: false,
                    ),
                    SizedBox(height: 15),
                    buildBanner(),
                    compareMyPhoto(),
                  ],
                ),
              ),
              buildGallery(),
            ],
          ),
        ),
      ),
    );
  }

  buildBanner() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 15),
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(15),
            decoration: BoxDecoration(color: AppColors.danger.withOpacity(0.1), borderRadius: BorderRadius.circular(20)),
            child: Stack(
              children: [
                Row(
                  children: [
                    Assets.images.svg.icProgressPhoto.svg(),
                    SizedBox(width: 10),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Reminder',
                          style: TextStyle(fontSize: 12, fontWeight: FontWeight.w400, height: 1.5, color: AppColors.danger),
                        ),
                        SizedBox(height: 5),
                        Text(
                          'Next Photos Fall On July 08',
                          style: TextStyle(fontSize: 14, height: 1.5, fontWeight: FontWeight.w500),
                        )
                      ],
                    ),
                  ],
                ),
                Align(
                  alignment: Alignment.topRight,
                  child: Assets.images.svg.icCancel.svg(),
                )
              ],
            ),
          ),
          SizedBox(height: 20),
          Container(
            decoration:
                BoxDecoration(borderRadius: BorderRadius.circular(20), gradient: AppGradient.blueGradient, color: AppColors.white.withOpacity(0.2)),
            padding: EdgeInsets.all(15),
            child: Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Track Your Progress Each Month With Photo',
                        style: TextStyle(fontSize: 14, height: 1.5, fontWeight: FontWeight.w500),
                      ),
                      Container(
                        decoration: BoxDecoration(
                          gradient: AppGradient.blueGradient,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                        margin: EdgeInsets.only(top: 15),
                        child: Text(
                          'Learn More',
                          style: TextStyle(
                            fontSize: 10,
                            height: 1.5,
                            fontWeight: FontWeight.w600,
                            color: AppColors.white,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      )
                    ],
                  ),
                ),
                Assets.images.png.imgProgressPhoto2.image()
              ],
            ),
          )
        ],
      ),
    );
  }

  compareMyPhoto() {
    return Container(
      decoration: BoxDecoration(gradient: AppGradient.blueGradient, color: AppColors.white.withOpacity(0.2), borderRadius: BorderRadius.circular(20)),
      padding: EdgeInsets.symmetric(vertical: 18, horizontal: 20),
      child: Row(
        children: [
          Expanded(
            child: Text(
              'Compare my Photo',
              style: TextStyle(
                fontSize: 14,
                height: 1.5,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          AppButton(
            padding: EdgeInsets.symmetric(vertical: 5, horizontal: 15),
            borderRadius: BorderRadius.circular(50),
            child: Text(
              'Compare',
              style: TextStyle(
                fontSize: 12,
                color: AppColors.white,
                fontWeight: FontWeight.w600,
              ),
            ),
          )
        ],
      ),
    );
  }

  buildGallery() {
    List<String> imagesBefore = [
      Assets.images.png.imgFrontFacing.path,
      Assets.images.png.imgBackFacingBefore.path,
      Assets.images.png.imgLeftFacingBefore.path,
      Assets.images.png.imgRightFacingBefore.path,
    ];
    List<String> imagesAfter = [
      Assets.images.png.imgFrontFacingAfter.path,
      Assets.images.png.imgBackFacingAfter.path,
      Assets.images.png.imgLeftFacingAfter.path,
      Assets.images.png.imgRightFacingAfter.path,
    ];

    var size = (MediaQuery.of(context).size.width - 75) / 3;
    return Padding(
      padding: const EdgeInsets.only(left: 30, top: 15, bottom: 15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AppHeader(
            title: 'Gallery',
            subTitle: 'See More',
          ),
          SizedBox(height: 15),
          Text(
            '2 June',
            style: TextStyle(fontSize: 12, fontWeight: FontWeight.w400, color: AppColors.grayDark),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: SizedBox(
              height: size,
              child: ListView.separated(
                itemBuilder: (context, index) {
                  return Container(
                    width: size,
                    height: size,
                    decoration: BoxDecoration(color: AppColors.border, borderRadius: BorderRadius.circular(20)),
                    child: Image.asset(
                      imagesBefore[index],
                      width: size,
                      height: size,
                      fit: BoxFit.contain,
                    ),
                  );
                },
                separatorBuilder: (context, index) {
                  return SizedBox(width: 10);
                },
                shrinkWrap: true,
                itemCount: imagesBefore.length,
                scrollDirection: Axis.horizontal,
              ),
            ),
          ),
          SizedBox(height: 15),
          Text(
            '5 May',
            style: TextStyle(fontSize: 12, fontWeight: FontWeight.w400, color: AppColors.grayDark),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: SizedBox(
              height: size,
              child: ListView.separated(
                itemBuilder: (context, index) {
                  return Container(
                    width: size,
                    height: size,
                    decoration: BoxDecoration(color: AppColors.border, borderRadius: BorderRadius.circular(20)),
                    child: Image.asset(
                      imagesAfter[index],
                      width: size,
                      height: size,
                      fit: BoxFit.contain,
                    ),
                  );
                },
                separatorBuilder: (context, index) {
                  return SizedBox(width: 10);
                },
                shrinkWrap: true,
                itemCount: imagesAfter.length,
                scrollDirection: Axis.horizontal,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
