import 'package:coffee_life/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

import 'features/personalization/presentation/pages/settings/settings.dart';
import 'utils/constants/colors.dart';

class NavigationMenu extends StatelessWidget {
  const NavigationMenu({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(NavigationController());
    final darkMode = HelperFunctions.isDarkMode(context);

    return Scaffold(
      bottomNavigationBar: Obx(
        () => NavigationBar(
          height: 70,
          elevation: 0,
          selectedIndex: controller.selectedIndex.value,
          onDestinationSelected: (index) => controller.selectedIndex.value = index,
          backgroundColor: darkMode ? AppColors.black : Colors.white,
          indicatorColor: darkMode ? AppColors.white.withOpacity(0.1) : AppColors.black.withOpacity(0.1),
          destinations: const [
            NavigationDestination(icon: FaIcon(FontAwesomeIcons.house), label: 'Home'),
            NavigationDestination(icon: FaIcon(FontAwesomeIcons.receipt), label: 'Recipes'),
            NavigationDestination(icon: FaIcon(FontAwesomeIcons.store), label: 'Store'),
            NavigationDestination(icon: FaIcon(FontAwesomeIcons.meetup), label: 'Meet&Coffee'),
            NavigationDestination(icon: FaIcon(FontAwesomeIcons.solidUser), label: 'Profile'),
          ],
        ),
      ),
      body: Obx(() => controller.screens[controller.selectedIndex.value]),
    );
  }
}

class NavigationController extends GetxController {
  final Rx<int> selectedIndex = 0.obs;

  final screens = [
    const Scaffold(backgroundColor: Colors.orange),
    const Scaffold(backgroundColor: Colors.red),
    const Scaffold(backgroundColor: Colors.blue),
    const Scaffold(backgroundColor: Colors.green),
    const SettingsScreen(),
  ];
}
