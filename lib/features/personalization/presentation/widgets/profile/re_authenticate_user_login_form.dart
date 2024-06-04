import 'package:coffee_life/utils/constants/text_strings.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

import '../../../../../common/widgets/appbar/appbar.dart';
import '../../../../../utils/constants/sizes.dart';
import '../../../../../utils/validators/validation.dart';
import '../../controllers/user_controller.dart';

class ReAuthLoginForm extends StatelessWidget {
  const ReAuthLoginForm({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = UserController.instance;
    return Scaffold(
      appBar: const CustomAppBar(title: Text('Re-Authenticate User'), showBackArrow: true),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(Sizes.defaultSpace),
          child: Form(
            key: controller.reAuthFormKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextFormField(
                  controller: controller.verifyEmail,
                  validator: Validator.validateEmail,
                  decoration: const InputDecoration(prefixIcon: FaIcon(FontAwesomeIcons.arrowRight), labelText: TextStrings.email),
                ),
                const SizedBox(height: Sizes.spaceBtwInputFields),
                Obx(
                  () => TextFormField(
                    obscureText: controller.hidePassword.value,
                    controller: controller.verifyPassword,
                    validator: (value) => Validator.validateEmptyText('Password', value),
                    decoration: InputDecoration(
                      prefixIcon: const FaIcon(FontAwesomeIcons.lock),
                      labelText: TextStrings.password,
                      suffixIcon: IconButton(
                        onPressed: () => controller.hidePassword.value = !controller.hidePassword.value,
                        icon: const FaIcon(FontAwesomeIcons.eyeSlash),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: Sizes.spaceBtwSections),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(onPressed: () => controller.reAuthenticateEmailAndPasswordUser(), child: const Text('Verify')),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
