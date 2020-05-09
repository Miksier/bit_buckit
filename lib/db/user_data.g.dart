// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_data.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class UserDateAdapter extends TypeAdapter<UserDate> {
  @override
  final typeId = 0;

  @override
  UserDate read(BinaryReader reader) {
    var numOfFields = reader.readByte();
    var fields = <int, dynamic>{
      for (var i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return UserDate(
      projectKey: fields[0] as String,
      pullRequestId: fields[2] as int,
      repositorySlug: fields[1] as String,
      userName: fields[3] as String,
    );
  }

  @override
  void write(BinaryWriter writer, UserDate obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.projectKey)
      ..writeByte(1)
      ..write(obj.repositorySlug)
      ..writeByte(2)
      ..write(obj.pullRequestId)
      ..writeByte(3)
      ..write(obj.userName);
  }
}
