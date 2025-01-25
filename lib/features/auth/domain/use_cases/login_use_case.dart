import 'package:dartz/dartz.dart';
import 'package:iac_task/core/errors/failure.dart';
import 'package:iac_task/core/use_case/use_case.dart';
import 'package:iac_task/features/auth/data/models/user_data_model.dart';
import 'package:iac_task/features/auth/domain/repo/auth_repo.dart';
import 'package:iac_task/features/auth/domain/strategy/login_strategy.dart';

class LoginUseCase extends UseCase<UserDataModel,LoginStrategy>{
  final AuthRepo authRepo;

  LoginUseCase(this.authRepo);

  @override
  Future<Either<Failure, UserDataModel>> call([LoginStrategy? param]) {
    return authRepo.login(param!);
  }

}
