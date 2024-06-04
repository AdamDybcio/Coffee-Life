import 'package:coffee_life/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

import '../../../../../utils/constants/text_strings.dart';
import '../../../../../utils/validators/validation.dart';
import '../../controllers/login/login_controller.dart';
import '../../pages/password_configuration/forget_password.dart';
import '../../pages/signup/signup.dart';

class LoginForm extends StatelessWidget {
  const LoginForm({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(LoginController());
    return Form(
      key: controller.loginFormKey,
      child: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: Sizes.spaceBtwSections,
        ),
        child: Column(
          children: [
            TextFormField(
              controller: controller.email,
              validator: (value) => Validator.validateEmail(value),
              decoration: const InputDecoration(
                prefixIcon: FaIcon(FontAwesomeIcons.solidEnvelope),
                labelText: TextStrings.email,
              ),
            ),
            const SizedBox(height: Sizes.spaceBtwInputFields),
            Obx(
              () => TextFormField(
                controller: controller.password,
                validator: (value) => Validator.validateEmptyText('Password', value),
                obscureText: controller.hidePassword.value,
                decoration: InputDecoration(
                  prefixIcon: const FaIcon(FontAwesomeIcons.lock),
                  labelText: TextStrings.password,
                  suffixIcon: IconButton(
                    onPressed: () => controller.hidePassword.value = !controller.hidePassword.value,
                    icon: FaIcon(controller.hidePassword.value ? FontAwesomeIcons.eyeSlash : FontAwesomeIcons.eye),
                  ),
                ),
              ),
            ),
            const SizedBox(height: Sizes.spaceBtwInputFields / 2),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Obx(
                      () => Checkbox(
                        value: controller.rememberMe.value,
                        onChanged: (value) => controller.rememberMe.value = !controller.rememberMe.value,
                      ),
                    ),
                    const Text(TextStrings.rememberMe),
                  ],
                ),
                TextButton(
                  onPressed: () => Get.to(() => const ForgetPassword()),
                  child: const Text(TextStrings.forgetPassword),
                ),
              ],
            ),
            const SizedBox(height: Sizes.spaceBtwInputFields),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () => controller.emailAndPasswordSignIn(),
                child: const Text(TextStrings.signIn),
              ),
            ),
            const SizedBox(height: Sizes.spaceBtwItems),
            SizedBox(
              width: double.infinity,
              child: OutlinedButton(
                onPressed: () => Get.to(() => const SignupScreen()),
                child: const Text(TextStrings.createAccount),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
