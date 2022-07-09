class LoginResDto {
  final String? username;
  final String? password;

  LoginResDto(this.username, this.password);

  Map<String, dynamic> toJson() => {
    "username":username,
    "password":password,
  };
}