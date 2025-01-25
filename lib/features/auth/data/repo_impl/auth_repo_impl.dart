import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:iac_task/core/errors/failure.dart';
import 'package:iac_task/core/errors/server_failure.dart';
import 'package:iac_task/core/utils/app_strings.dart';
import 'package:iac_task/features/auth/data/data_sources/remote_data_source/auth_remote_data_source.dart';
import 'package:iac_task/features/auth/data/models/user_data_model.dart';
import 'package:iac_task/features/auth/domain/repo/auth_repo.dart';
import 'package:iac_task/features/auth/domain/strategy/login_strategy.dart';
import 'package:iac_task/features/auth/domain/strategy/register_strategy.dart';

class AuthRepoImpl extends AuthRepo{
  final AuthRemoteDataSource authRemoteDataSource;

  AuthRepoImpl({required this.authRemoteDataSource});

  @override
  Future<Either<Failure, UserDataModel>> login(LoginStrategy authStrategy)async {
    try{
      var userModel = await authStrategy.login();
      return Right(userModel);
    }
    catch (e){
      if(e is DioException){
        return Left(ServerFailure.fromDioException(e));
      }
      else if(e is FirebaseException)
        {
          return Left(ServerFailure(errMessage: e.message!));
        }
      return Left(ServerFailure(errMessage: AppStrings.someThingWentWrong));
    }
  }


  @override
  Future<Either<Failure, void>> register(RegisterStrategy registerStrategy) async {
    try{
       await registerStrategy.register();
        return const Right(null);
    }
    catch (e){
      if(e is DioException){
        return Left(ServerFailure.fromDioException(e));
      }
      else if(e is FirebaseException)
      {
        return Left(ServerFailure(errMessage: e.message!));
      }
      return Left(ServerFailure(errMessage: AppStrings.someThingWentWrong));
    }
  }
  }

