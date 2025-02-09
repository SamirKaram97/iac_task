import 'package:dartz/dartz.dart';
import 'package:iac_task/core/errors/failure.dart';

abstract class UseCase<Type, Param> {
  Future<Either<Failure, Type>> call([Param param]);
}

class NoParam {}
