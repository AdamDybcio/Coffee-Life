import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../utils/constants/sizes.dart';
import '../../../../../utils/constants/text_strings.dart';
import '../../controllers/signup/signup_controller.dart';

class TermsAndConditionsCheckbox extends StatelessWidget {
  const TermsAndConditionsCheckbox({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = SignupController.instance;
    return Row(
      children: [
        SizedBox(
          width: 19,
          height: 19,
          child: Obx(
            () => Checkbox(value: controller.privacyPolicy.value, onChanged: (value) => controller.privacyPolicy.value = !controller.privacyPolicy.value),
          ),
        ),
        const SizedBox(width: Sizes.spaceBtwItems),
        Text.rich(
          TextSpan(
            children: [
              TextSpan(
                text: "${TextStrings.iAgreeTo} ",
                style: Theme.of(context).textTheme.bodySmall,
              ),
              TextSpan(
                text: TextStrings.privacyPolicy,
                style: Theme.of(context).textTheme.bodyMedium!.apply(
                      decoration: TextDecoration.underline,
                    ),
              ),
              TextSpan(
                text: " ${TextStrings.and} ",
                style: Theme.of(context).textTheme.bodySmall,
              ),
              TextSpan(
                text: "${TextStrings.termsOfUse} ",
                style: Theme.of(context).textTheme.bodyMedium!.apply(
                      decoration: TextDecoration.underline,
                    ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
