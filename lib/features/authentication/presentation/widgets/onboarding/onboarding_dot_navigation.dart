import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../../../../utils/constants/sizes.dart';
import '../../../../../utils/device/device_utils.dart';
import '../../controllers/onboarding/onboarding_controller.dart';

class OnBoardingDotNavigation extends StatelessWidget {
  const OnBoardingDotNavigation({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = OnBoardingController.instance;

    return Positioned(
      bottom: DeviceUtils.getBottomNavigationBarHeight() + 10,
      left: Sizes.defaultSpace,
      child: SmoothPageIndicator(
        effect: const ExpandingDotsEffect(
          dotHeight: 15,
          dotWidth: 15,
        ),
        controller: controller.pageController,
        onDotClicked: controller.dotNavigationClick,
        count: 4,
      ),
    );
  }
}
