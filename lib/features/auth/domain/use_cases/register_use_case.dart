import 'package:dartz/dartz.dart';
import 'package:iac_task/core/errors/failure.dart';
import 'package:iac_task/core/use_case/use_case.dart';
import 'package:iac_task/features/auth/domain/repo/auth_repo.dart';
import 'package:iac_task/features/auth/domain/strategy/register_strategy.dart';

class RegisterUseCase extends UseCase<void,RegisterStrategy>{
  final AuthRepo authRepo;

  RegisterUseCase(this.authRepo);
  @override
  Future<Either<Failure, void>> call([RegisterStrategy? param]) {
    return authRepo.register(param!);
  }
}



