import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../../../utils/constants/sizes.dart';

class ProfileMenu extends StatelessWidget {
  const ProfileMenu({
    super.key,
    this.icon = FontAwesomeIcons.arrowRight,
    required this.onPressed,
    required this.title,
    required this.value,
  });

  final IconData icon;
  final VoidCallback onPressed;
  final String title, value;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: Sizes.spaceBtwItems / 1.5),
        child: Row(
          children: [
            Expanded(flex: 3, child: Text(title, style: Theme.of(context).textTheme.bodySmall, overflow: TextOverflow.ellipsis)),
            Expanded(
              flex: 5,
              child: Text(value, style: Theme.of(context).textTheme.bodyMedium, overflow: TextOverflow.ellipsis),
            ),
            Expanded(child: FaIcon(icon, size: 18)),
          ],
        ),
      ),
    );
  }
}
