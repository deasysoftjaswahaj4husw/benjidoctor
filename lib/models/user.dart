class User {
  final String? name;
  final String? username;
  final String? email;
  final String phone;
  final String? qualification;
  final String? registration_number;
  final String? location;
  final String? role;
  final String createdAt;
  final String updatedAt;

  User(
      {this.name,
      this.username,
      this.email,
      required this.phone,
      this.qualification,
      this.registration_number,
      this.location,
      this.role,
      required this.createdAt,
      required this.updatedAt});
}
