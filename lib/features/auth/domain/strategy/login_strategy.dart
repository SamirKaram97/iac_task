import 'package:iac_task/features/auth/data/models/user_data_model.dart';

abstract class LoginStrategy {
  Future<UserDataModel> login();
}