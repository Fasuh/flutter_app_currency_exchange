import 'package:hive/hive.dart';

abstract class InitScreenDataSource {
  Future<bool> hasBeenShownAlready();

  Future setScreenShown();
}

class InitScreenDataSourceImpl extends InitScreenDataSource {
  InitScreenDataSourceImpl({required this.source});

  static const initScreenShown = 'INIT_SCREEN_SHOWN';

  final Box<bool> source;

  @override
  Future<bool> hasBeenShownAlready() async {
    return source.get(initScreenShown) ?? false;
  }

  @override
  Future setScreenShown() async {
    return source.put(initScreenShown, true);
  }
}
