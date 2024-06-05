import 'package:coffee_life/features/authentication/data/repositories/authentication_repo_impl.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import '../../../../../common/widgets/appbar/appbar.dart';
import '../../../../../common/widgets/custom_shapes/containers/primary_header_container.dart';
import '../../../../../common/widgets/list_tiles/settings_menu_tile.dart';
import '../../../../../common/widgets/list_tiles/user_profile_tile.dart';
import '../../../../../common/widgets/texts/section_heading.dart';
import '../../../../../utils/constants/sizes.dart';
import '../profile/profile.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            PrimaryHeaderContainer(
              child: Column(
                children: [
                  CustomAppBar(title: Text('Account', style: Theme.of(context).textTheme.headlineMedium)),
                  UserProfileTile(onPressed: () => Get.to(() => const ProfileScreen())),
                  const SizedBox(height: Sizes.spaceBtwSections),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(Sizes.defaultSpace),
              child: Column(
                children: [
                  const SectionHeading(title: 'Account Settings', showActionButton: false),
                  const SizedBox(height: Sizes.spaceBtwItems),
                  const SettingsMenuTile(icon: FontAwesomeIcons.bagShopping, title: 'My Cart', subTitle: 'Add, remove products and move to checkout'),
                  const SettingsMenuTile(icon: FontAwesomeIcons.bagShopping, title: 'My Orders', subTitle: 'In-progress and Completed Orders'),
                  const SettingsMenuTile(icon: FontAwesomeIcons.solidBell, title: 'Notifications', subTitle: 'Set any kind of notification message'),
                  const SizedBox(height: Sizes.spaceBtwSections),
                  const SectionHeading(title: 'App Settings', showActionButton: false),
                  const SizedBox(height: Sizes.spaceBtwItems),
                  const SettingsMenuTile(icon: FontAwesomeIcons.upload, title: 'Load Data', subTitle: 'Upload Data to your Cloud Firebase'),
                  SettingsMenuTile(
                    icon: FontAwesomeIcons.locationCrosshairs,
                    title: 'Geolocation',
                    subTitle: 'Set recommendation based on location',
                    trailing: Switch(value: true, onChanged: (value) {}),
                  ),
                  SettingsMenuTile(
                    icon: FontAwesomeIcons.locationCrosshairs,
                    title: 'Safe Mode',
                    subTitle: 'Search result is safe for all ages',
                    trailing: Switch(value: false, onChanged: (value) {}),
                  ),
                  SettingsMenuTile(
                    icon: FontAwesomeIcons.locationCrosshairs,
                    title: 'HD Image Quality',
                    subTitle: 'Set image quality to be seen',
                    trailing: Switch(value: false, onChanged: (value) {}),
                  ),
                  const SizedBox(height: Sizes.spaceBtwSections),
                  SizedBox(
                    width: double.infinity,
                    child: OutlinedButton(onPressed: () => AuthenticationRepoImpl.instance.logout(), child: const Text('Logout')),
                  ),
                  const SizedBox(height: Sizes.spaceBtwSections * 2.5),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
