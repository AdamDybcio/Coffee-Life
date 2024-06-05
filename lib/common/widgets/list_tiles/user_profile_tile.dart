import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

import '../../../features/personalization/presentation/controllers/user_controller.dart';
import '../../../utils/constants/image_strings.dart';
import '../images/circular_image.dart';
import '../shimmers/shimmer.dart';

class UserProfileTile extends StatelessWidget {
  const UserProfileTile({
    super.key,
    required this.onPressed,
  });

  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    final controller = UserController.instance;
    return ListTile(
      leading: Obx(() {
        final networkImage = controller.user.value.profilePicture;
        final image = networkImage.isNotEmpty ? networkImage : ImageStrings.user;
        return controller.imageUploading.value
            ? const CustomShimmerEffect(width: 50, height: 50, radius: 50)
            : CircularImage(image: image, width: 50, height: 50, isNetworkImage: networkImage.isNotEmpty, padding: 0);
      }),
      title: Text(controller.user.value.firstName, style: Theme.of(context).textTheme.headlineSmall),
      subtitle: Text(controller.user.value.email, style: Theme.of(context).textTheme.bodyMedium),
      trailing: IconButton(onPressed: onPressed, icon: const FaIcon(FontAwesomeIcons.penToSquare)),
    );
  }
}
