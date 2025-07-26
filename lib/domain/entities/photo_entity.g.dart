// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'photo_entity.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class PhotoEntityAdapter extends TypeAdapter<PhotoEntity> {
  @override
  final int typeId = 0;

  @override
  PhotoEntity read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return PhotoEntity(
      originalPhotoUrl: fields[0] as String?,
      localOriginalPhotoPath: fields[1] as String?,
      id: fields[2] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, PhotoEntity obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.originalPhotoUrl)
      ..writeByte(1)
      ..write(obj.localOriginalPhotoPath)
      ..writeByte(2)
      ..write(obj.id);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is PhotoEntityAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
