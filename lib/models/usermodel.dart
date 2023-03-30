class UserModel {
  String name;
  String email;

  UserModel({
    required this.name,
    required this.email,
  });

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
        name: map['name'] as String, email: map['email'] as String);
  }

  Map<String, dynamic> toMap() {
    return {
      'name': this.name,
      'email': this.email,
    } as Map<String, dynamic>;
  }
}
