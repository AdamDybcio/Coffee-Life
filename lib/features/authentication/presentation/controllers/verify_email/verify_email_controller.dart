import 'dart:async';

import 'package:coffee_life/features/authentication/data/repositories/authentication_repo_impl.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

import '../../../../../common/widgets/success_screen/success_screen.dart';
import '../../../../../utils/constants/image_strings.dart';
import '../../../../../utils/constants/text_strings.dart';
import '../../../../../utils/popups/loaders.dart';

class VerifyEmailController extends GetxController {
  static VerifyEmailController get instance => Get.find();

  @override
  void onInit() {
    sendEmailVerification();
    setTimerForAutoRedirect();
    super.onInit();
  }

  sendEmailVerification() async {
    try {
      await AuthenticationRepoImpl.instance.sendEmailVerification();
      Loaders.succcessSnackBar(title: 'Email sent!', message: 'Check your inbox and verify your email.');
    } catch (e) {
      Loaders.errorSnackBar(title: 'Oh No!', message: e.toString());
    }
  }

  setTimerForAutoRedirect() {
    Timer.periodic(
      const Duration(seconds: 1),
      (timer) async {
        await FirebaseAuth.instance.currentUser?.reload();
        final user = FirebaseAuth.instance.currentUser;
        if (user?.emailVerified ?? false) {
          timer.cancel();
          Get.off(
            () => SuccessScreen(
              image: ImageStrings.successfullyRegisterAnimation,
              title: TextStrings.yourAccountCreatedTitle,
              subtitle: TextStrings.yourAccountCreatedSubTitle,
              onPressed: () => AuthenticationRepoImpl.instance.screenRedirect(),
            ),
          );
        }
      },
    );
  }

  checkEmailVerificationStatus() async {
    final currentUser = FirebaseAuth.instance.currentUser;
    if (currentUser != null && currentUser.emailVerified) {
      Get.off(
        () => SuccessScreen(
          image: ImageStrings.successfullyRegisterAnimation,
          title: TextStrings.yourAccountCreatedTitle,
          subtitle: TextStrings.yourAccountCreatedSubTitle,
          onPressed: () => AuthenticationRepoImpl.instance.screenRedirect(),
        ),
      );
    }
  }
}
