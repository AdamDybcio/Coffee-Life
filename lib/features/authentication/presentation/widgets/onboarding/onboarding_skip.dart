import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../../../utils/constants/sizes.dart';
import '../../../../../utils/device/device_utils.dart';
import '../../controllers/onboarding/onboarding_controller.dart';

class OnBoardingSkip extends StatelessWidget {
  const OnBoardingSkip({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: DeviceUtils.getAppBarHeight(),
      right: Sizes.defaultSpace,
      child: ElevatedButton(
        onPressed: () => OnBoardingController.instance.skipPage(),
        child: const FaIcon(FontAwesomeIcons.anglesRight),
      ),
    );
  }
}
