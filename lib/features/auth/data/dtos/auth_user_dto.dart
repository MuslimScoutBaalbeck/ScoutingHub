final class AuthUserDto {
  const AuthUserDto({
    required this.id,
    required this.name,
    required this.email,
  });

  factory AuthUserDto.fromJson(Map<String, dynamic> json) {
    return AuthUserDto(
      id: json['id'] as int,
      name: json['name'] as String,
      email: json['email'] as String,
    );
  }

  final int id;
  final String name;
  final String email;
}
