import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:coffee_life/features/authentication/domain/entities/user_entity.dart';

class UserModel extends UserEntity {
  UserModel({
    required super.id,
    required super.firstName,
    required super.username,
    required super.email,
    required super.profilePicture,
  });

  static String generateUsername(firstName) => "${firstName}_coffeelife";

  static UserModel empty() => UserModel(id: '', firstName: '', username: '', email: '', profilePicture: '');

  Map<String, dynamic> toJson() {
    return {
      'firstName': firstName,
      'username': username,
      'email': email,
      'profilePicture': profilePicture,
    };
  }

  factory UserModel.fromSnapshot(DocumentSnapshot<Map<String, dynamic>> document) {
    if (document.data() != null) {
      final data = document.data()!;
      return UserModel(
        id: document.id,
        firstName: data['firstName'] ?? '',
        username: data['username'] ?? '',
        email: data['email'] ?? '',
        profilePicture: data['profilePicture'] ?? '',
      );
    } else {
      return UserModel.empty();
    }
  }
}
