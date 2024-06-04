import 'package:coffee_life/features/authentication/data/repositories/authentication_repo_impl.dart';
import 'package:coffee_life/features/authentication/data/repositories/user_repo_impl.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../services/network_manager.dart';
import '../../../../../utils/constants/image_strings.dart';
import '../../../../../utils/popups/full_screen_loader.dart';
import '../../../../../utils/popups/loaders.dart';
import '../../../data/models/user_model.dart';
import '../../pages/signup/verify_email.dart';

class SignupController extends GetxController {
  static SignupController get instance => Get.find();

  final hidePassword = true.obs;
  final privacyPolicy = true.obs;
  final email = TextEditingController();
  final username = TextEditingController();
  final password = TextEditingController();
  final firstName = TextEditingController();
  GlobalKey<FormState> signupFormKey = GlobalKey<FormState>();

  void signup() async {
    try {
      FullScreenLoader.openLoadingDialog('We are processing your information...', ImageStrings.docerAnimation);
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        FullScreenLoader.stopLoading();
        return;
      }
      if (!signupFormKey.currentState!.validate()) {
        FullScreenLoader.stopLoading();
        return;
      }
      if (!privacyPolicy.value) {
        FullScreenLoader.stopLoading();
        Loaders.warningSnackBar(title: 'Accept Privacy Policy', message: 'In order to create account, you must have to read and accept the Privacy Policy & Terms Of Use.');
        return;
      }
      final userCredential = await AuthenticationRepoImpl.instance.registerWithEmailAndPassword(email.text.trim(), password.text.trim());
      final newUser = UserModel(
        id: userCredential.user!.uid,
        firstName: firstName.text.trim(),
        username: username.text.trim(),
        email: email.text.trim(),
        profilePicture: '',
      );
      final userRepository = Get.put(UserRepoImpl());
      await userRepository.saveUserRecord(newUser);
      FullScreenLoader.stopLoading();
      Loaders.succcessSnackBar(title: 'Congratulations', message: 'Your account has been created! Verify your email to continue.');
      Get.to(() => VerifyEmailScreen(email: email.text.trim()));
    } catch (e) {
      FullScreenLoader.stopLoading();
      Loaders.errorSnackBar(title: 'Oh No!', message: e.toString());
    }
  }
}
