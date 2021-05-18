import 'package:dartz/dartz.dart';
import 'package:flutter_app_zal/core/error/failures.dart';
import 'package:flutter_app_zal/core/usecase/usecase.dart';
import '../repositories/init_screen_repository.dart';

class SetIsAlreadyShownUseCase extends UseCase<bool, NoParams> {
  SetIsAlreadyShownUseCase({required this.repository});

  final InitScreenRepository repository;

  @override
  Future<Either<Failure, bool>> call(NoParams params) {
    return repository.setScreenShown();
  }
}