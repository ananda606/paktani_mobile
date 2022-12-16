import 'dart:convert';

class UserModel {
  int? iduser;
  String username;
  String email;
  String password;
  String userAddress;
  String userPhoneNumber;
 

  UserModel({
    this.iduser,
    required this.email,
    required this.password,
    required this.username,
    required this.userAddress,
    required this.userPhoneNumber,

  });
  factory UserModel.fromJson(Map<String, dynamic> map) {
    return UserModel(
      email: map['email'],
      username: map['username'],
      password: map['password'],
      userAddress: map['userAddress'],
      userPhoneNumber: map['userPhoneNumber'],
     
    );
  }
  Map<String, dynamic> toJson() {
    return {
      'iduser': iduser,
      'email': email,
      'username': username,
      'password': password,
      'userAddress': userAddress,
      'userPhoneNumber': userPhoneNumber,
   
    };
  }

  @override
  String toString() {
    return 'UserModel{id:$iduser, email:$email, password:$password, username:$username, userAddress:$userAddress, userPhoneNumber:$userPhoneNumber,}';
  }
}

List<UserModel> userFromJson(String jsonData) {
  final data = json.decode(jsonData);
  return List<UserModel>.from(
    data.map(
      (item) => UserModel.fromJson(item),
    ),
  );
}

String userToJson(UserModel data) {
  final jsonData = data.toJson();
  return json.encode(jsonData);
}
