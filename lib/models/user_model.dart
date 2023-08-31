
class UserModel {
  final String? id;
  final String userName;
  final String email;
  final String password;
  final String phoneNumber;

  const UserModel({
    this.id,
    required this.userName,
    required this.email,
    required this.password,
    required this.phoneNumber,
  });

  toJson() {
    return {
      "userName": userName,
      "email": email,
      "password": password,
      "phoneNumber": phoneNumber
    };
  }

  factory UserModel.fromSnabShot(
      dynamic document) {
    final data = document.data()!;
    return UserModel(
        id: document.id,
        userName: data["userName"],
        email: data["email"],
        password: data["password"],
        phoneNumber: data["phoneNumber"]);
  }
}
