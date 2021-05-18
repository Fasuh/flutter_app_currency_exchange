import 'package:dartz/dartz.dart';
import 'package:flutter_app_zal/core/error/failures.dart';
import 'package:flutter_app_zal/core/error/form_decoder.dart';
import 'package:flutter_app_zal/features/init_screen/domain/repositories/init_screen_repository.dart';
import '../data_sources/init_screen_data_source.dart';

class InitScreenRepositoryImpl extends InitScreenRepository {
  InitScreenRepositoryImpl({required this.dataSource});

  final InitScreenDataSource dataSource;

  @override
  Future<Either<Failure, bool>> hasBeenShownAlready() async {
    try {
      final value = await dataSource.hasBeenShownAlready();
      return Right(value);
    } catch (error) {
      return Left(handleError(error, defaultFailure: DefaultInitScreenDataFailure()));
    }
  }

  @override
  Future<Either<Failure, bool>> setScreenShown() async {
    try {
      final value = await dataSource.setScreenShown();
      return Right(value);
    } catch (error) {
      return Left(handleError(error, defaultFailure: DefaultInitScreenDataFailure()));
    }
  }
}
