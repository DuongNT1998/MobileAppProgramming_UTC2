class UserModel {
  String? id;
  String name;
  String email;
  String createdAt;

  UserModel({
    this.id,
    required this.name,
    required this.email,
    required this.createdAt,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['id'].toString(),
      name: json['name'],
      email: json['email'],
      createdAt: json['createdAt'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'email': email,
      'createdAt': createdAt,
    };
  }

  /// dùng cho PATCH
  Map<String, dynamic> toPatchJson({
    bool updateName = false,
    bool updateEmail = false,
  }) {
    Map<String, dynamic> data = {};

    if (updateName) {
      data['name'] = name;
    }
    if (updateEmail) {
      data['email'] = email;
    }

    return data;
  }
}
