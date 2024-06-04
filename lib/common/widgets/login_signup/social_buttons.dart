import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../features/authentication/presentation/controllers/login/login_controller.dart';
import '../../../utils/constants/image_strings.dart';
import '../../../utils/constants/sizes.dart';

class SocialButtons extends StatelessWidget {
  const SocialButtons({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(LoginController());
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          decoration: BoxDecoration(
            border: Border.all(color: Theme.of(context).splashColor),
            borderRadius: BorderRadius.circular(100),
          ),
          child: IconButton(
            onPressed: () => controller.googleSignIn(),
            icon: const Image(
              width: Sizes.iconMd,
              height: Sizes.iconMd,
              image: AssetImage(ImageStrings.google),
            ),
          ),
        ),
      ],
    );
  }
}
