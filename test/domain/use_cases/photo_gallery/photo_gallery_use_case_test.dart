import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:photo_gallery_app/api/client/api_result.dart';
import 'package:photo_gallery_app/domain/entities/photo_entity.dart';
import 'package:photo_gallery_app/domain/repositories/photo_gallery/photo_gallery_repository.dart';
import 'package:photo_gallery_app/domain/use_cases/photo_gallery/photo_gallery_use_case.dart';

import 'photo_gallery_use_case_test.mocks.dart';

@GenerateMocks([PhotoGalleryRepository])
void main() {
  test(
    'when call invoke it should use photoGalleryRepository to call fetchPhotoGallery',
    () async {
      // Arrange

      MockPhotoGalleryRepository mockedPhotoGalleryRepository =
          MockPhotoGalleryRepository();
      PhotoGalleryUseCase useCase = PhotoGalleryUseCase(
        mockedPhotoGalleryRepository,
      );
      int page = 1;
      int perPage = 10;
      List<PhotoEntity> expectedResult = [
        PhotoEntity(
          id: "1",
          originalPhotoUrl: "http1",
          localOriginalPhotoPath: "no1",
        ),
        PhotoEntity(
          id: "2",
          originalPhotoUrl: "http2",
          localOriginalPhotoPath: "no2",
        ),
      ];
      var expectedSuccessResult = Success(expectedResult);
      provideDummy<Result<List<PhotoEntity>?>>(expectedSuccessResult);
      when(
        mockedPhotoGalleryRepository.fetchPhotoGallery(
          page: page,
          perPage: perPage,
        ),
      ).thenAnswer((_) async => expectedSuccessResult);

      // Act
      var actualResult = await useCase.invoke(page: page, perPage: perPage);

      // Assert
      verify(
        mockedPhotoGalleryRepository.fetchPhotoGallery(
          page: page,
          perPage: perPage,
        ),
      ).called(1);
      expect(actualResult, isA<Success>());
      expect(Success(actualResult).data, equals(expectedSuccessResult));
    },
  );
}
