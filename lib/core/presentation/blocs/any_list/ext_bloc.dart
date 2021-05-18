part of 'any_list_bloc.dart';

abstract class ExtBloc<E, S> extends Bloc<E, S> {
  bool disposed = false;

  ExtBloc(S initialState) : super(initialState);

  @override
  Future<void> close() {
    disposed = true;
    print("ExtBloc is DISPOSED!!!");
    return super.close();
  }
}
