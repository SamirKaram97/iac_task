import 'package:iac_task/features/auth/data/data_sources/remote_data_source/auth_remote_data_source.dart';
import 'package:iac_task/features/auth/domain/strategy/register_strategy.dart';

class FacebookRegisterStrategy implements RegisterStrategy {
  final AuthRemoteDataSource authRemoteDataSource;

  FacebookRegisterStrategy(this.authRemoteDataSource);

  @override
  Future<void> register() {
    return authRemoteDataSource.registerFacebook();
  }
}