import 'package:equatable/equatable.dart';
import 'package:flutter_app_zal/core/error/failures.dart';
import 'package:flutter_app_zal/core/usecase/usecase.dart';
import 'package:flutter_app_zal/features/init_screen/domain/use_cases/check_is_already_shown_use_case.dart';
import 'package:flutter_app_zal/features/init_screen/domain/use_cases/set_is_already_shown_use_case.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'init_screen_event.dart';

part 'init_screen_state.dart';

class InitScreenBloc extends Bloc<InitScreenEvent, InitScreenState> {
  InitScreenBloc({
    required this.checkIsAlreadyShownUseCase,
    required this.setIsAlreadyShownUseCase,
  }) : super(InitScreenNotInitializedState());

  final CheckIsAlreadyShownUseCase checkIsAlreadyShownUseCase;
  final SetIsAlreadyShownUseCase setIsAlreadyShownUseCase;

  @override
  Stream<InitScreenState> mapEventToState(InitScreenEvent event) async* {
    if (event is InitScreenAppStartedEvent) {
      yield* _mapInitScreenAppStarted();
    }
  }

  Stream<InitScreenState> _mapInitScreenAppStarted() async* {
    final result = await checkIsAlreadyShownUseCase(NoParams());
    yield* result.fold((failure) async* {
      yield InitScreenErrorState(failure: failure);
    }, (data) async* {
      if(!data) {
        await setIsAlreadyShownUseCase(NoParams());
      }
      yield InitScreenDataState(wasShownAlready: data);
    });
  }
}
