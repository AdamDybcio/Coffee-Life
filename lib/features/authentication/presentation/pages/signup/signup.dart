import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../../common/widgets/appbar/appbar.dart';
import '../../../../../common/widgets/login_signup/form_divider.dart';
import '../../../../../common/widgets/login_signup/social_buttons.dart';
import '../../../../../utils/constants/sizes.dart';
import '../../../../../utils/constants/text_strings.dart';
import '../../widgets/signup/signup_form.dart';

class SignupScreen extends StatelessWidget {
  const SignupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(showBackArrow: true),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(Sizes.defaultSpace),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                TextStrings.signupTitle,
                style: Theme.of(context).textTheme.headlineMedium,
              ),
              const SizedBox(height: Sizes.spaceBtwSections),
              const SignupForm(),
              const SizedBox(height: Sizes.spaceBtwSections),
              FormDivider(dividerText: TextStrings.orText.capitalize!),
              const SizedBox(height: Sizes.spaceBtwSections),
              const SocialButtons(),
            ],
          ),
        ),
      ),
    );
  }
}
