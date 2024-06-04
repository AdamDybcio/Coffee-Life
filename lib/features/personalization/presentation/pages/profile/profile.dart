import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

import '../../../../../common/widgets/appbar/appbar.dart';
import '../../../../../common/widgets/images/circular_image.dart';
import '../../../../../common/widgets/shimmers/shimmer.dart';
import '../../../../../common/widgets/texts/section_heading.dart';
import '../../../../../utils/constants/image_strings.dart';
import '../../../../../utils/constants/sizes.dart';
import '../../controllers/user_controller.dart';
import '../../widgets/profile/change_name.dart';
import '../../widgets/profile/profile_menu.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = UserController.instance;
    return Scaffold(
      appBar: const CustomAppBar(
        title: Text('Profile'),
        showBackArrow: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(Sizes.defaultSpace),
          child: Column(
            children: [
              SizedBox(
                width: double.infinity,
                child: Column(
                  children: [
                    Obx(() {
                      final networkImage = controller.user.value.profilePicture;
                      final image = networkImage.isNotEmpty ? networkImage : ImageStrings.user;
                      return controller.imageUploading.value
                          ? const CustomShimmerEffect(width: 80, height: 80, radius: 80)
                          : CircularImage(image: image, width: 80, height: 80, isNetworkImage: networkImage.isNotEmpty);
                    }),
                    TextButton(onPressed: () => controller.uploadUserProfilePicture(), child: const Text('Change Profile Picture')),
                  ],
                ),
              ),
              const SizedBox(height: Sizes.spaceBtwItems / 2),
              const Divider(),
              const SizedBox(height: Sizes.spaceBtwItems),
              const SectionHeading(title: 'Profile Information', showActionButton: false),
              const SizedBox(height: Sizes.spaceBtwItems),
              ProfileMenu(title: 'Name', value: controller.user.value.firstName, onPressed: () => Get.to(() => const ChangeName())),
              ProfileMenu(title: 'Username', value: controller.user.value.username, onPressed: () {}),
              const SizedBox(height: Sizes.spaceBtwItems),
              const Divider(),
              const SizedBox(height: Sizes.spaceBtwItems),
              const SectionHeading(title: 'Personal Information', showActionButton: false),
              const SizedBox(height: Sizes.spaceBtwItems),
              ProfileMenu(onPressed: () {}, title: 'User ID', value: controller.user.value.id, icon: FontAwesomeIcons.copy),
              ProfileMenu(onPressed: () {}, title: 'E-mail', value: controller.user.value.email),
              ProfileMenu(onPressed: () {}, title: 'Gender', value: 'Male'),
              ProfileMenu(onPressed: () {}, title: 'Date of Birth', value: '28 Jan, 2002'),
              const Divider(),
              const SizedBox(height: Sizes.spaceBtwItems),
              Center(
                child: TextButton(
                  onPressed: () => controller.deleteAccountWarningPopup(),
                  child: const Text('Close Account', style: TextStyle(color: Colors.red)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
