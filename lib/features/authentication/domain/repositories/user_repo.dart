import 'package:image_picker/image_picker.dart';

import '../../data/models/user_model.dart';

abstract class UserRepo {
  Future<void> saveUserRecord(UserModel user);

  Future<UserModel> fetchUserDetails();

  Future<void> updateUserDetails(UserModel updatedUser);

  Future<void> updateSingleField(Map<String, dynamic> json);

  Future<void> removeUserRecord(String userId);

  Future<String> uploadImage(String path, XFile image);
}
