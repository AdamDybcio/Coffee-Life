import 'package:coffee_life/features/authentication/data/repositories/authentication_repo_impl.dart';
import 'package:coffee_life/utils/popups/full_screen_loader.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../services/network_manager.dart';
import '../../../../../utils/constants/image_strings.dart';
import '../../../../../utils/popups/loaders.dart';
import '../../pages/password_configuration/reset_password.dart';

class ForgetPasswordController extends GetxController {
  static ForgetPasswordController get instance => Get.find();

  final email = TextEditingController();
  GlobalKey<FormState> forgetPasswordFormKey = GlobalKey<FormState>();

  sendPasswordResetEmail() async {
    try {
      FullScreenLoader.openLoadingDialog('Processing your request...', ImageStrings.docerAnimation);

      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        FullScreenLoader.stopLoading();
        return;
      }

      if (!forgetPasswordFormKey.currentState!.validate()) {
        FullScreenLoader.stopLoading();
        return;
      }

      await AuthenticationRepoImpl.instance.sendPasswordResetEmail(email.text.trim());

      FullScreenLoader.stopLoading();

      Loaders.succcessSnackBar(title: 'Email Sent', message: 'Email Link Sent to Reset Your Password.');

      Get.to(() => ResetPassword(email: email.text.trim()));
    } catch (e) {
      FullScreenLoader.stopLoading();
      Loaders.errorSnackBar(title: 'Oh No!', message: e.toString());
    }
  }

  resendPasswordResetEmail(String email) async {
    try {
      FullScreenLoader.openLoadingDialog('Processing your request...', ImageStrings.docerAnimation);

      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        FullScreenLoader.stopLoading();
        return;
      }

      await AuthenticationRepoImpl.instance.sendPasswordResetEmail(email);

      FullScreenLoader.stopLoading();

      Loaders.succcessSnackBar(title: 'Email Sent', message: 'Email Link Sent to Reset Your Password.');
    } catch (e) {
      FullScreenLoader.stopLoading();
      Loaders.errorSnackBar(title: 'Oh No!', message: e.toString());
    }
  }
}
