import 'failures.dart';

Failure handleError(dynamic error, {required Failure defaultFailure}) {
  if(error is Failure) {
    return error;
  }
  return defaultFailure;
}
