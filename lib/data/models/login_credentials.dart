class LoginCredentials {
  LoginCredentials({
    required this.username,
    required this.password,
  });

  String username;
  String password;

  LoginCredentials copyWith({
    String? username,
    String? password,
  }) {
    return LoginCredentials(
      username: username ?? this.username,
      password: password ?? this.password,
    );
  }
}
