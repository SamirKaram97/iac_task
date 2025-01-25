import 'package:iac_task/features/auth/data/data_sources/remote_data_source/auth_remote_data_source.dart';
import 'package:iac_task/features/auth/data/models/user_data_model.dart';
import 'package:iac_task/features/auth/domain/strategy/login_strategy.dart';

class FacebookLoginStrategy implements LoginStrategy {
  final AuthRemoteDataSource authRemoteDataSource;

  FacebookLoginStrategy(this.authRemoteDataSource);

  @override
  Future<UserDataModel> login() {
    return authRemoteDataSource.loginFacebook();
  }
}