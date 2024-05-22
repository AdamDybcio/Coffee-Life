import 'package:coffee_life/bindings/general_bindings.dart';
import 'package:coffee_life/utils/constants/colors.dart';
import 'package:coffee_life/utils/constants/sizes.dart';
import 'package:coffee_life/utils/device/device_utils.dart';
import 'package:coffee_life/utils/themes/theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Coffee Life',
      debugShowCheckedModeBanner: false,
      initialBinding: GeneralBindings(),
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      home: Scaffold(
        backgroundColor: AppColors.primary,
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                width: DeviceUtils.getScreenWidth(context) * 0.6,
                child: const FittedBox(
                  fit: BoxFit.fitWidth,
                  child: Text('Loading...'),
                ),
              ),
              const SizedBox(height: Sizes.spaceBtwSections),
              SizedBox(
                width: DeviceUtils.getScreenWidth(context) * 0.15,
                child: const FittedBox(
                  fit: BoxFit.cover,
                  child: CircularProgressIndicator(color: Colors.white),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
