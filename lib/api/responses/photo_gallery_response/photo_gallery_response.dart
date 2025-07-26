import 'package:json_annotation/json_annotation.dart';
import 'package:photo_gallery_app/api/models/photo_model/photo_model.dart';

part 'photo_gallery_response.g.dart';

@JsonSerializable()
class PhotoGalleryResponse {
  @JsonKey(name: "page")
  final int? page;
  @JsonKey(name: "per_page")
  final int? perPage;
  @JsonKey(name: "photos")
  final List<PhotoModel>? photos;
  @JsonKey(name: "total_results")
  final int? totalResults;
  @JsonKey(name: "next_page")
  final String? nextPage;

  PhotoGalleryResponse({
    this.page,
    this.perPage,
    this.photos,
    this.totalResults,
    this.nextPage,
  });

  factory PhotoGalleryResponse.fromJson(Map<String, dynamic> json) {
    return _$PhotoGalleryResponseFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$PhotoGalleryResponseToJson(this);
  }
}
