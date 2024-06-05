import 'package:coffee_life/features/authentication/data/repositories/authentication_repo_impl.dart';
import 'package:coffee_life/features/personalization/presentation/controllers/user_controller.dart';
import 'package:coffee_life/services/network_manager.dart';
import 'package:get/get.dart';

import '../features/authentication/data/repositories/user_repo_impl.dart';

class GeneralBindings extends Bindings {
  @override
  void dependencies() {
    Get.put(AuthenticationRepoImpl());
    Get.put(NetworkManager());
    Get.put(UserRepoImpl());
    Get.put(UserController());
  }
}
