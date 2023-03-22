// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class UserAuthModel {
  String email;
  String password;
  bool returnSecureToken = true;
  UserAuthModel({
    required this.email,
    required this.password,
    required this.returnSecureToken,
  });

  UserAuthModel copyWith({
    String? email,
    String? password,
    bool? returnSecureToken,
  }) {
    return UserAuthModel(
      email: email ?? this.email,
      password: password ?? this.password,
      returnSecureToken: returnSecureToken ?? this.returnSecureToken,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'email': email,
      'password': password,
      'returnSecureToken': returnSecureToken,
    };
  }

  factory UserAuthModel.fromMap(Map<String, dynamic> map) {
    return UserAuthModel(
      email: map['email'] as String,
      password: map['password'] as String,
      returnSecureToken: map['returnSecureToken'] as bool,
    );
  }

  String toJson() => json.encode(toMap());

  factory UserAuthModel.fromJson(String source) =>
      UserAuthModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() =>
      'UserAuthModel(email: $email, password: $password, returnSecureToken: $returnSecureToken)';

  @override
  bool operator ==(covariant UserAuthModel other) {
    if (identical(this, other)) return true;

    return other.email == email &&
        other.password == password &&
        other.returnSecureToken == returnSecureToken;
  }

  @override
  int get hashCode =>
      email.hashCode ^ password.hashCode ^ returnSecureToken.hashCode;
}
