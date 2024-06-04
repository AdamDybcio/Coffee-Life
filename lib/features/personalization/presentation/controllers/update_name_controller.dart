import 'package:coffee_life/features/authentication/data/repositories/user_repo_impl.dart';
import 'package:coffee_life/features/personalization/presentation/controllers/user_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../services/network_manager.dart';
import '../../../../utils/constants/image_strings.dart';
import '../../../../utils/popups/full_screen_loader.dart';
import '../../../../utils/popups/loaders.dart';
import '../pages/profile/profile.dart';

class UpdateNameController extends GetxController {
  static UpdateNameController get instance => Get.find();

  final firstName = TextEditingController();
  final userController = UserController.instance;
  final userRepository = Get.put(UserRepoImpl());
  GlobalKey<FormState> updateUserNameFormKey = GlobalKey<FormState>();

  @override
  void onInit() {
    initializeNames();
    super.onInit();
  }

  Future<void> initializeNames() async {
    firstName.text = userController.user.value.firstName;
  }

  Future<void> updateUserName() async {
    try {
      FullScreenLoader.openLoadingDialog('We are updating your information...', ImageStrings.docerAnimation);

      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        FullScreenLoader.stopLoading();
        return;
      }

      if (!updateUserNameFormKey.currentState!.validate()) {
        FullScreenLoader.stopLoading();
        return;
      }

      Map<String, dynamic> name = {'firstName': firstName.text.trim()};
      await userRepository.updateSingleField(name);

      userController.user.value.firstName = firstName.text.trim();

      FullScreenLoader.stopLoading();

      Loaders.succcessSnackBar(title: 'Congratulations', message: 'Your name has been updated.');

      Get.off(() => const ProfileScreen());
    } catch (e) {
      FullScreenLoader.stopLoading();
      Loaders.errorSnackBar(title: 'Oh No!', message: e.toString());
    }
  }
}
