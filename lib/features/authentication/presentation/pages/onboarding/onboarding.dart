import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../../../utils/constants/image_strings.dart';
import '../../../../../utils/constants/text_strings.dart';
import '../../controllers/onboarding/onboarding_controller.dart';
import '../../widgets/onboarding/onboarding_dot_navigation.dart';
import '../../widgets/onboarding/onboarding_next_button.dart';
import '../../widgets/onboarding/onboarding_page.dart';
import '../../widgets/onboarding/onboarding_skip.dart';

class OnBoardingScreen extends StatelessWidget {
  const OnBoardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(OnBoardingController());

    return Scaffold(
      body: Stack(
        children: [
          PageView(
            controller: controller.pageController,
            onPageChanged: controller.updatePageIndicator,
            children: const [
              OnBoardingPage(
                image: ImageStrings.onBoardingImage1,
                title: TextStrings.onBoardingTitle1,
                subTitle: TextStrings.onBoardingSubTitle1,
              ),
              OnBoardingPage(
                image: ImageStrings.onBoardingImage2,
                title: TextStrings.onBoardingTitle2,
                subTitle: TextStrings.onBoardingSubTitle2,
              ),
              OnBoardingPage(
                image: ImageStrings.onBoardingImage3,
                title: TextStrings.onBoardingTitle3,
                subTitle: TextStrings.onBoardingSubTitle3,
              ),
              OnBoardingPage(
                image: ImageStrings.onBoardingImage4,
                title: TextStrings.onBoardingTitle4,
                subTitle: TextStrings.onBoardingSubTitle4,
              ),
            ],
          ),
          const OnBoardingSkip(),
          const OnBoardingDotNavigation(),
          const OnBoardingNextButton(),
        ],
      ),
    );
  }
}
