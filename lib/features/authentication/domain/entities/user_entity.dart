abstract class UserEntity {
  final String id;
  String firstName;
  final String username;
  final String email;
  String profilePicture;

  UserEntity({
    required this.id,
    required this.firstName,
    required this.username,
    required this.email,
    required this.profilePicture,
  });
}
