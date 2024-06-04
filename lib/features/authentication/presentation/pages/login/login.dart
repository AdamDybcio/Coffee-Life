import 'package:coffee_life/utils/device/device_utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../common/styles/spacing_styles.dart';
import '../../../../../common/widgets/login_signup/form_divider.dart';
import '../../../../../common/widgets/login_signup/social_buttons.dart';
import '../../../../../utils/constants/sizes.dart';
import '../../../../../utils/constants/text_strings.dart';
import '../../widgets/login/login_form.dart';
import '../../widgets/login/login_header.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        onTap: () => DeviceUtils.hideKeyboard(context),
        child: SingleChildScrollView(
          child: Padding(
            padding: SpacingStyles.paddingWithAppBarHeight,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const LoginHeader(),
                const LoginForm(),
                FormDivider(dividerText: TextStrings.orText.capitalize!),
                const SizedBox(height: Sizes.spaceBtwSections),
                const SocialButtons(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
