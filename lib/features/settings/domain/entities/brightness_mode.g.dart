// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'brightness_mode.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class BrightnessModeAdapter extends TypeAdapter<BrightnessMode> {
  @override
  final int typeId = 1;

  @override
  BrightnessMode read(BinaryReader reader) {
    switch (reader.readByte()) {
      case 0:
        return BrightnessMode.Light;
      case 1:
        return BrightnessMode.Dark;
      default:
        return BrightnessMode.Light;
    }
  }

  @override
  void write(BinaryWriter writer, BrightnessMode obj) {
    switch (obj) {
      case BrightnessMode.Light:
        writer.writeByte(0);
        break;
      case BrightnessMode.Dark:
        writer.writeByte(1);
        break;
    }
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is BrightnessModeAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
