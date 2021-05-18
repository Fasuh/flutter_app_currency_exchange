part of 'settings_bloc.dart';

abstract class SettingsBlocState extends Equatable {
  @override
  List<Object?> get props => [];
}

class SettingsBlocInitialState extends SettingsBlocState {}

class SettingsBlocInitialErrorState extends SettingsBlocState {
  SettingsBlocInitialErrorState({
    required this.failure,
  });

  final Failure failure;

  @override
  List<Object?> get props => [failure];
}

class SettingsBlocDataState extends SettingsBlocState {
  SettingsBlocDataState({required this.settings});

  final Settings settings;

  @override
  List<Object?> get props => [settings];
}

class SettingsBlocErrorSavingState extends SettingsBlocDataState {
  SettingsBlocErrorSavingState({
    required this.failure,
    required Settings settings,
  }) : super(settings: settings);

  final Failure failure;

  @override
  List<Object?> get props => [
        failure,
        settings,
      ];
}
