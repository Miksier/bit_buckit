// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'credentials.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class CredentialsAdapter extends TypeAdapter<Credentials> {
  @override
  final typeId = 0;

  @override
  Credentials read(BinaryReader reader) {
    var numOfFields = reader.readByte();
    var fields = <int, dynamic>{
      for (var i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Credentials(
      url: fields[0] as String,
      token: fields[1] as String,
      userName: fields[2] as String,
    );
  }

  @override
  void write(BinaryWriter writer, Credentials obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.url)
      ..writeByte(1)
      ..write(obj.token)
      ..writeByte(2)
      ..write(obj.userName);
  }
}
