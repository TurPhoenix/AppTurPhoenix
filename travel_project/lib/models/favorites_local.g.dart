// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'favorites_local.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class FavoritesLocalAdapter extends TypeAdapter<FavoritesLocal> {
  @override
  final int typeId = 0;

  @override
  FavoritesLocal read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return FavoritesLocal()
      ..id = fields[0] as String?
      ..nombre = fields[1] as String?
      ..ubicacion = fields[2] as String?
      ..departamento = fields[3] as String?
      ..temperatura = fields[4] as String?
      ..detalle = fields[5] as String?
      ..descripcion = fields[6] as String?
      ..categoria = fields[7] as String?
      ..foto = fields[8] as String?;
  }

  @override
  void write(BinaryWriter writer, FavoritesLocal obj) {
    writer
      ..writeByte(9)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.nombre)
      ..writeByte(2)
      ..write(obj.ubicacion)
      ..writeByte(3)
      ..write(obj.departamento)
      ..writeByte(4)
      ..write(obj.temperatura)
      ..writeByte(5)
      ..write(obj.detalle)
      ..writeByte(6)
      ..write(obj.descripcion)
      ..writeByte(7)
      ..write(obj.categoria)
      ..writeByte(8)
      ..write(obj.foto);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is FavoritesLocalAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
