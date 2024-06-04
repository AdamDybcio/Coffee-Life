import 'package:coffee_life/features/authentication/data/repositories/authentication_repo_impl.dart';
import 'package:coffee_life/features/personalization/presentation/controllers/user_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../../../../../services/network_manager.dart';
import '../../../../../utils/constants/image_strings.dart';
import '../../../../../utils/popups/full_screen_loader.dart';
import '../../../../../utils/popups/loaders.dart';

class LoginController extends GetxController {
  final rememberMe = true.obs;
  final hidePassword = true.obs;
  final localStorage = GetStorage();
  final email = TextEditingController();
  final password = TextEditingController();
  GlobalKey<FormState> loginFormKey = GlobalKey<FormState>();
  final userController = Get.put(UserController());

  @override
  void onInit() {
    if (localStorage.read("REMEMBER_ME_EMAIL") != null) {
      email.text = localStorage.read("REMEMBER_ME_EMAIL");
    }
    if (localStorage.read("REMEMBER_ME_PASSWORD") != null) {
      password.text = localStorage.read("REMEMBER_ME_PASSWORD");
    }
    super.onInit();
  }

  Future<void> emailAndPasswordSignIn() async {
    try {
      FullScreenLoader.openLoadingDialog('Logging you in...', ImageStrings.docerAnimation);

      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        FullScreenLoader.stopLoading();
        return;
      }
      if (!loginFormKey.currentState!.validate()) {
        FullScreenLoader.stopLoading();
        return;
      }
      if (rememberMe.value) {
        localStorage.write("REMEMBER_ME_EMAIL", email.text.trim());
        localStorage.write("REMEMBER_ME_PASSWORD", password.text.trim());
      } else {
        localStorage.remove("REMEMBER_ME_EMAIL");
        localStorage.remove("REMEMBER_ME_PASSWORD");
      }
      // ignore: unused_local_variable
      final userCredentials = await AuthenticationRepoImpl.instance.loginWithEmailAndPassword(email.text.trim(), password.text.trim());

      FullScreenLoader.stopLoading();
      AuthenticationRepoImpl.instance.screenRedirect();
    } catch (e) {
      FullScreenLoader.stopLoading();
      Loaders.errorSnackBar(title: 'Oh No!', message: e.toString());
    }
  }

  Future<void> googleSignIn() async {
    try {
      FullScreenLoader.openLoadingDialog('Logging you in...', ImageStrings.docerAnimation);

      final isConnected = await NetworkManager.instance.isConnected();

      if (!isConnected) {
        FullScreenLoader.stopLoading();
        return;
      }

      // ignore: unused_local_variable
      final userCredentials = await AuthenticationRepoImpl.instance.signInWithGoogle();

      await userController.saveUserRecord(userCredentials);

      localStorage.remove("REMEMBER_ME_EMAIL");
      localStorage.remove("REMEMBER_ME_PASSWORD");

      FullScreenLoader.stopLoading();

      AuthenticationRepoImpl.instance.screenRedirect();
    } catch (e) {
      FullScreenLoader.stopLoading();
      Loaders.errorSnackBar(title: 'Oh No!', message: e.toString());
    }
  }
}
