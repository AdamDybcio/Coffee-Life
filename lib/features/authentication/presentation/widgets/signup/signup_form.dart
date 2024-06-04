import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

import '../../../../../utils/constants/sizes.dart';
import '../../../../../utils/constants/text_strings.dart';
import '../../../../../utils/validators/validation.dart';
import '../../controllers/signup/signup_controller.dart';
import 'terms_conditions_checkbox.dart';

class SignupForm extends StatelessWidget {
  const SignupForm({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(SignupController());
    return Form(
      key: controller.signupFormKey,
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: TextFormField(
                  controller: controller.firstName,
                  validator: (value) => Validator.validateEmptyText('First name', value),
                  expands: false,
                  decoration: const InputDecoration(
                    labelText: TextStrings.firstName,
                    prefixIcon: FaIcon(FontAwesomeIcons.solidUser),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: Sizes.spaceBtwInputFields),
          TextFormField(
            controller: controller.username,
            validator: (value) => Validator.validateEmptyText('Username', value),
            expands: false,
            decoration: const InputDecoration(
              labelText: TextStrings.username,
              prefixIcon: FaIcon(FontAwesomeIcons.userPen),
            ),
          ),
          const SizedBox(height: Sizes.spaceBtwInputFields),
          TextFormField(
            controller: controller.email,
            validator: (value) => Validator.validateEmail(value),
            decoration: const InputDecoration(
              labelText: TextStrings.email,
              prefixIcon: FaIcon(FontAwesomeIcons.solidEnvelope),
            ),
          ),
          const SizedBox(height: Sizes.spaceBtwInputFields),
          Obx(
            () => TextFormField(
              controller: controller.password,
              validator: (value) => Validator.validatePassword(value),
              obscureText: controller.hidePassword.value,
              decoration: InputDecoration(
                labelText: TextStrings.password,
                prefixIcon: const FaIcon(FontAwesomeIcons.lock),
                suffixIcon: IconButton(
                  onPressed: () => controller.hidePassword.value = !controller.hidePassword.value,
                  icon: Icon(controller.hidePassword.value ? FontAwesomeIcons.eyeSlash : FontAwesomeIcons.eye),
                ),
              ),
            ),
          ),
          const SizedBox(height: Sizes.spaceBtwInputFields),
          const TermsAndConditionsCheckbox(),
          const SizedBox(height: Sizes.spaceBtwSections),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () => controller.signup(),
              child: const Text(TextStrings.createAccount),
            ),
          ),
        ],
      ),
    );
  }
}
