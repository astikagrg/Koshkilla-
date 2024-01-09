class UserEntity {
  final String? id;

  final String? image;
  final String email;
  final String username;
  final String password;

  UserEntity({
    this.id,
    this.image,
    required this.email,
    required this.username,
    required this.password,
  });
}
