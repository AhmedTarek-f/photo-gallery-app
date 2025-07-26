import 'package:equatable/equatable.dart';
import 'package:hive/hive.dart';

part 'photo_entity.g.dart';

@HiveType(typeId: 0)
class PhotoEntity extends HiveObject with EquatableMixin {
  PhotoEntity({this.originalPhotoUrl, this.localOriginalPhotoPath, this.id});
  @HiveField(0)
  final String? originalPhotoUrl;
  @HiveField(1)
  String? localOriginalPhotoPath;
  @HiveField(2)
  String? id;

  @override
  List<Object?> get props => [originalPhotoUrl, id];
}
