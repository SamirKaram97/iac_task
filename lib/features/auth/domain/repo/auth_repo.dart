import 'package:dartz/dartz.dart';
import 'package:iac_task/core/errors/failure.dart';
import 'package:iac_task/features/auth/data/models/user_data_model.dart';
import 'package:iac_task/features/auth/domain/strategy/login_strategy.dart';
import 'package:iac_task/features/auth/domain/strategy/register_strategy.dart';

abstract class AuthRepo{
  Future<Either<Failure,UserDataModel>> login(LoginStrategy authStrategy);
  Future<Either<Failure,void>> register(RegisterStrategy registerStrategy);
}