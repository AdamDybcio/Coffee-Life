import 'package:coffee_life/features/authentication/data/repositories/authentication_repo_impl.dart';
import 'package:coffee_life/features/authentication/data/repositories/user_repo_impl.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

import '../../../../services/network_manager.dart';
import '../../../../utils/constants/image_strings.dart';
import '../../../../utils/constants/sizes.dart';
import '../../../../utils/popups/full_screen_loader.dart';
import '../../../../utils/popups/loaders.dart';
import '../../../authentication/data/models/user_model.dart';
import '../../../authentication/presentation/pages/login/login.dart';
import '../widgets/profile/re_authenticate_user_login_form.dart';

class UserController extends GetxController {
  static UserController get instance => Get.find();

  final profileLoading = false.obs;
  Rx<UserModel> user = UserModel.empty().obs;

  final hidePassword = true.obs;
  final imageUploading = false.obs;
  final verifyEmail = TextEditingController();
  final verifyPassword = TextEditingController();
  final userRepository = Get.put(UserRepoImpl());
  GlobalKey<FormState> reAuthFormKey = GlobalKey<FormState>();

  @override
  void onInit() {
    super.onInit();
    fetchUserRecord();
  }

  Future<void> fetchUserRecord() async {
    try {
      profileLoading.value = true;
      final user = await userRepository.fetchUserDetails();
      this.user(user);
    } catch (e) {
      user(UserModel.empty());
    } finally {
      profileLoading.value = false;
    }
  }

  Future<void> saveUserRecord(UserCredential? userCredentials) async {
    try {
      if (userCredentials != null) {
        final username = UserModel.generateUsername(userCredentials.user!.displayName ?? '');

        final user = UserModel(
          id: userCredentials.user!.uid,
          firstName: userCredentials.user!.displayName ?? '',
          username: username,
          email: userCredentials.user!.email ?? '',
          profilePicture: userCredentials.user!.photoURL ?? '',
        );

        await userRepository.saveUserRecord(user);
      }
    } catch (e) {
      Loaders.warningSnackBar(title: 'Data not saved', message: 'Something went wrong while saving your information. You can re-save your data in your profile.');
    }
  }

  void deleteAccountWarningPopup() {
    Get.defaultDialog(
      contentPadding: const EdgeInsets.all(Sizes.md),
      title: 'Delete Account',
      middleText: 'Are you sure you want to delete your account permamently? This action is not reversable.',
      confirm: ElevatedButton(
        onPressed: () async => deleteUserAccount(),
        style: ElevatedButton.styleFrom(backgroundColor: Colors.red, side: const BorderSide(color: Colors.red)),
        child: const Padding(padding: EdgeInsets.symmetric(horizontal: Sizes.lg), child: Text('Delete')),
      ),
      cancel: OutlinedButton(
        onPressed: () => Navigator.of(Get.overlayContext!).pop(),
        child: const Text(
          'Cancel',
        ),
      ),
    );
  }

  void deleteUserAccount() async {
    try {
      FullScreenLoader.openLoadingDialog('Processing...', ImageStrings.docerAnimation);

      final auth = AuthenticationRepoImpl.instance;
      final provider = auth.authUser!.providerData.map((e) => e.providerId).first;
      if (provider.isNotEmpty) {
        if (provider == 'google.com') {
          await auth.signInWithGoogle();
          await auth.deleteAccount();
          FullScreenLoader.stopLoading();
          Get.offAll(() => const LoginScreen());
        } else if (provider == 'password') {
          FullScreenLoader.stopLoading();
          Get.to(() => const ReAuthLoginForm());
        }
      }
    } catch (e) {
      FullScreenLoader.stopLoading();
      Loaders.warningSnackBar(title: 'Oh No!', message: e.toString());
    }
  }

  Future<void> reAuthenticateEmailAndPasswordUser() async {
    try {
      FullScreenLoader.openLoadingDialog('Processing...', ImageStrings.docerAnimation);

      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        FullScreenLoader.stopLoading();
        return;
      }

      if (!reAuthFormKey.currentState!.validate()) {
        FullScreenLoader.stopLoading();
        return;
      }

      await AuthenticationRepoImpl.instance.reAuthenticateWithEmailAndPassword(verifyEmail.text.trim(), verifyPassword.text.trim());
      await AuthenticationRepoImpl.instance.deleteAccount();
      FullScreenLoader.stopLoading();
      Get.offAll(() => const LoginScreen());
    } catch (e) {
      FullScreenLoader.stopLoading();
      Loaders.warningSnackBar(title: 'Oh No!', message: e.toString());
    }
  }

  void uploadUserProfilePicture() async {
    try {
      final image = await ImagePicker().pickImage(source: ImageSource.gallery, imageQuality: 70, maxHeight: 512, maxWidth: 512);
      if (image != null) {
        imageUploading.value = true;

        final imageUrl = await userRepository.uploadImage('Users/Images/Profile/', image);

        Map<String, dynamic> json = {'ProfilePicture': imageUrl};
        await userRepository.updateSingleField(json);

        user.value.profilePicture = imageUrl;
        user.refresh();

        Loaders.succcessSnackBar(title: 'Congratulations', message: 'Your profile image has been updated!');
      }
    } catch (e) {
      Loaders.errorSnackBar(title: 'Oh No!', message: 'Something went wrong: $e');
    } finally {
      imageUploading.value = false;
    }
  }
}
