import 'package:enum_to_string/enum_to_string.dart';
import 'package:fimber/fimber.dart';

enum Configs { local, development, production, staging }

abstract class AppConfig {
  final String apiHostName;

  String get api => 'https://$apiHostName/';

  AppConfig._(this.apiHostName);

  static AppConfig get init => _getForFlavor;

  static AppConfig get _getForFlavor {
    final flavor = EnumToString.fromString(
      Configs.values,
      const String.fromEnvironment('flavor', defaultValue: 'production'),
    );
    switch (flavor) {
      case Configs.local:
        Fimber.plantTree(DebugTree());
        Fimber.d('local mode');
        return LocalConfig();
      case Configs.development:
        Fimber.plantTree(DebugTree());
        Fimber.d('debug mode');
        return DevConfig();
      case Configs.staging:
        Fimber.plantTree(DebugTree());
        Fimber.d('staging mode');
        return StagingConfig();
      case Configs.production:
        Fimber.d('release mode');
        return ProdConfig();
      default:
        throw UnimplementedError();
    }
  }
}

class DevConfig extends AppConfig {
  DevConfig() : super._("api.nbp.pl/api");
}

class StagingConfig extends AppConfig {
  StagingConfig() : super._("api.nbp.pl/api");
}

class ProdConfig extends AppConfig {
  ProdConfig() : super._("api.nbp.pl/api");
}

class LocalConfig extends AppConfig {
  LocalConfig() : super._("api.nbp.pl/api");
}
