// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth_hive.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class AuthHiveAdapter extends TypeAdapter<AuthHive> {
  @override
  final int typeId = 0;

  @override
  AuthHive read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return AuthHive(
      isLoggedIn: fields[0] as bool,
    );
  }

  @override
  void write(BinaryWriter writer, AuthHive obj) {
    writer
      ..writeByte(1)
      ..writeByte(0)
      ..write(obj.isLoggedIn);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is AuthHiveAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
