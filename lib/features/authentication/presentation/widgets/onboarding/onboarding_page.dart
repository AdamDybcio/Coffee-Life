import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import '../../../../../utils/constants/sizes.dart';
import '../../../../../utils/helpers/helper_functions.dart';

class OnBoardingPage extends StatelessWidget {
  const OnBoardingPage({
    super.key,
    required this.image,
    required this.title,
    required this.subTitle,
  });

  final String image, title, subTitle;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(Sizes.defaultSpace),
      child: Column(
        children: [
          Lottie.asset(
            image,
            width: HelperFunctions.screenWidth() * 0.8,
            height: HelperFunctions.screenHeight() * 0.6,
          ),
          Text(
            title,
            style: Theme.of(context).textTheme.headlineLarge,
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: Sizes.spaceBtwItems),
          Text(
            subTitle,
            style: Theme.of(context).textTheme.bodyLarge,
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
