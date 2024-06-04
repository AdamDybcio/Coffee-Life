import 'package:flutter/material.dart';

import '../../../../../utils/constants/image_strings.dart';
import '../../../../../utils/constants/sizes.dart';
import '../../../../../utils/constants/text_strings.dart';

class LoginHeader extends StatelessWidget {
  const LoginHeader({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(30),
          child: const Image(
            height: 150,
            image: AssetImage(
              ImageStrings.appLogo,
            ),
          ),
        ),
        const SizedBox(height: Sizes.lg),
        Text(
          TextStrings.loginTitle,
          style: Theme.of(context).textTheme.headlineSmall,
        ),
        const SizedBox(height: Sizes.sm),
        Text(
          TextStrings.loginSubTitle,
          style: Theme.of(context).textTheme.bodySmall,
        ),
      ],
    );
  }
}
