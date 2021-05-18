import 'package:dartz/dartz.dart';
import 'package:flutter_app_zal/core/error/failures.dart';

abstract class InitScreenRepository {
  Future<Either<Failure, bool>> hasBeenShownAlready();
  Future<Either<Failure, bool>> setScreenShown();
}