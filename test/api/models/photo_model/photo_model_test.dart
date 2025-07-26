import 'package:flutter_test/flutter_test.dart';
import 'package:photo_gallery_app/api/models/photo_model/photo_model.dart';
import 'package:photo_gallery_app/api/models/photo_model/src.dart';
import 'package:photo_gallery_app/domain/entities/photo_entity.dart';

void main() {
  group('test toPhotoEntity', () {
    test(
      "when call toPhotoEntity with null values it should return toPhotoEntity with null values",
      () {
        // Arrange
        Src src = Src(original: null);
        PhotoModel photoData = PhotoModel(
          id: null,
          width: null,
          height: null,
          alt: null,
          avgColor: null,
          liked: null,
          photographer: null,
          photographerId: null,
          photographerUrl: null,
          src: null,
          url: null,
        );
        // Act
        PhotoEntity photoEntity = photoData.toPhotoEntity();

        // Assert
        expect(photoData.id.toString(), equals(photoEntity.id));
        expect(photoData.src?.original, equals(photoEntity.originalPhotoUrl));
        expect(photoEntity.id, 'null');
        expect(photoEntity.originalPhotoUrl, isNull);
      },
    );
    test(
      "when call toPhotoEntity with non-nullable values it should return toPhotoEntity with correct values",
      () {
        // Arrange
        Src src = Src(original: "origin");
        PhotoModel photoData = PhotoModel(
          id: 0,
          width: 10,
          height: 20,
          alt: "al",
          avgColor: "red",
          liked: true,
          photographer: "tarek",
          photographerId: 200,
          photographerUrl: "http:ahmed.com",
          src: src,
          url: "photoUrl",
        );

        // Act
        PhotoEntity photoEntity = photoData.toPhotoEntity();

        // Assert
        expect(photoData.id.toString(), equals(photoEntity.id));
        expect(photoData.src?.original, equals(photoEntity.originalPhotoUrl));
      },
    );
  });
}
