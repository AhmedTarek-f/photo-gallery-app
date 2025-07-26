import 'package:json_annotation/json_annotation.dart';
import 'package:photo_gallery_app/api/models/photo_model/src.dart';
import 'package:photo_gallery_app/domain/entities/photo_entity.dart';

part 'photo_model.g.dart';

@JsonSerializable()
class PhotoModel {
  @JsonKey(name: "id")
  final int? id;
  @JsonKey(name: "width")
  final int? width;
  @JsonKey(name: "height")
  final int? height;
  @JsonKey(name: "url")
  final String? url;
  @JsonKey(name: "photographer")
  final String? photographer;
  @JsonKey(name: "photographer_url")
  final String? photographerUrl;
  @JsonKey(name: "photographer_id")
  final int? photographerId;
  @JsonKey(name: "avg_color")
  final String? avgColor;
  @JsonKey(name: "src")
  final Src? src;
  @JsonKey(name: "liked")
  final bool? liked;
  @JsonKey(name: "alt")
  final String? alt;

  PhotoModel({
    this.id,
    this.width,
    this.height,
    this.url,
    this.photographer,
    this.photographerUrl,
    this.photographerId,
    this.avgColor,
    this.src,
    this.liked,
    this.alt,
  });

  factory PhotoModel.fromJson(Map<String, dynamic> json) {
    return _$PhotoModelFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$PhotoModelToJson(this);
  }

  PhotoEntity toPhotoEntity() {
    return PhotoEntity(originalPhotoUrl: src?.original, id: id.toString());
  }
}
