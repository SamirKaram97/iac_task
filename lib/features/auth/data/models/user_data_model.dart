import 'package:firebase_auth/firebase_auth.dart';
import 'package:iac_task/features/auth/domain/entites/user_data_entity.dart';

class UserDataModel extends UserDataEntity {
  const UserDataModel(
      {required super.id,
      required super.email,
      required super.profileImage,
      required super.token,
      required super.name});

  factory UserDataModel.fromJson(Map<String, dynamic> json) {
    return UserDataModel(
      id: json['_id'],
      email: json['email'],
      name: json['name'],
      profileImage: json['profileImage'],
      token: json['token'],
    );
  }

  factory UserDataModel.fromCredentials(UserCredential userCredential) {
    return UserDataModel(
      id: userCredential.user!.uid,
      email: userCredential.user!.email,
      profileImage: userCredential.user!.email,
      token: userCredential.credential!.accessToken,
      name: userCredential.user!.displayName,
    );
  }

  //copy with
  UserDataModel copyWith({
    String? id,
    String?  name,
    String? email,
    String? profileImage,
    String? token,
  }) {
    return UserDataModel(
      id: id ?? this.id,
      email: email ?? this.email,
      name: name ?? this.name,
      profileImage: profileImage ?? this.profileImage,
      token: token ?? this.token,
    );
  }
}
