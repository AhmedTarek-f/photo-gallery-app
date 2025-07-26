// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'photo_gallery_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PhotoGalleryResponse _$PhotoGalleryResponseFromJson(
        Map<String, dynamic> json) =>
    PhotoGalleryResponse(
      page: (json['page'] as num?)?.toInt(),
      perPage: (json['per_page'] as num?)?.toInt(),
      photos: (json['photos'] as List<dynamic>?)
          ?.map((e) => PhotoModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      totalResults: (json['total_results'] as num?)?.toInt(),
      nextPage: json['next_page'] as String?,
    );

Map<String, dynamic> _$PhotoGalleryResponseToJson(
        PhotoGalleryResponse instance) =>
    <String, dynamic>{
      'page': instance.page,
      'per_page': instance.perPage,
      'photos': instance.photos,
      'total_results': instance.totalResults,
      'next_page': instance.nextPage,
    };
