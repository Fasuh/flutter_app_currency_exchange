import 'package:hive/hive.dart';

part 'brightness_mode.g.dart';

@HiveType(typeId: 1)
enum BrightnessMode {
  @HiveField(0)
  Light,
  @HiveField(1)
  Dark,
}
