import 'package:equatable/equatable.dart';

class UserDataEntity extends Equatable{
  final String id;
  final String? name;
  final String? email;
  final String? token;
  final String? profileImage;

  const UserDataEntity( {
    required this.id,
    required this.name,
    required this.email,
    required this.profileImage,
    required this.token
  });

  @override
  List<Object?> get props => [
    id,
    email,
    token,
    name,
    profileImage
  ];
}