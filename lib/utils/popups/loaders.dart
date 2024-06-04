import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

import '../constants/colors.dart';
import '../helpers/helper_functions.dart';

class Loaders {
  static hideSnackBar() => ScaffoldMessenger.of(Get.context!).hideCurrentSnackBar();

  static customToast({required message}) {
    ScaffoldMessenger.of(Get.context!).showSnackBar(
      SnackBar(
        elevation: 0,
        duration: const Duration(seconds: 3),
        backgroundColor: Colors.transparent,
        content: Container(
          padding: const EdgeInsets.all(12),
          margin: const EdgeInsets.symmetric(horizontal: 30),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30),
            color: HelperFunctions.isDarkMode(Get.context!) ? AppColors.darkerGrey.withOpacity(0.9) : AppColors.grey.withOpacity(0.9),
          ),
          child: Center(child: Text(message, style: Theme.of(Get.context!).textTheme.labelLarge)),
        ),
      ),
    );
  }

  static succcessSnackBar({required title, message = '', duration = 3}) {
    Get.snackbar(
      title,
      message,
      isDismissible: true,
      dismissDirection: DismissDirection.horizontal,
      shouldIconPulse: true,
      backgroundColor: Theme.of(Get.context!).snackBarTheme.backgroundColor,
      snackPosition: SnackPosition.BOTTOM,
      duration: Duration(seconds: duration),
      margin: const EdgeInsets.all(10),
      icon: const FaIcon(FontAwesomeIcons.circleCheck),
    );
  }

  static warningSnackBar({required title, message = ''}) {
    Get.snackbar(
      title,
      message,
      isDismissible: true,
      dismissDirection: DismissDirection.horizontal,
      shouldIconPulse: true,
      backgroundColor: Theme.of(Get.context!).snackBarTheme.backgroundColor,
      snackPosition: SnackPosition.BOTTOM,
      duration: const Duration(seconds: 3),
      margin: const EdgeInsets.all(20),
      icon: const FaIcon(FontAwesomeIcons.circleExclamation),
    );
  }

  static errorSnackBar({required title, message = ''}) {
    Get.snackbar(
      title,
      message,
      isDismissible: true,
      dismissDirection: DismissDirection.horizontal,
      shouldIconPulse: true,
      backgroundColor: Theme.of(Get.context!).snackBarTheme.backgroundColor,
      snackPosition: SnackPosition.BOTTOM,
      duration: const Duration(seconds: 3),
      margin: const EdgeInsets.all(20),
      icon: const FaIcon(FontAwesomeIcons.circleExclamation),
    );
  }
}
