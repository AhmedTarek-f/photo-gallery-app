import 'package:injectable/injectable.dart';
import 'package:photo_gallery_app/api/client/api_result.dart';
import 'package:photo_gallery_app/domain/entities/photo_entity.dart';
import 'package:photo_gallery_app/domain/repositories/photo_gallery/photo_gallery_repository.dart';

@injectable
class PhotoGalleryUseCase {
  final PhotoGalleryRepository _photoGalleryRepository;
  @factoryMethod
  const PhotoGalleryUseCase(this._photoGalleryRepository);

  Future<Result<List<PhotoEntity>?>> invoke({
    required int page,
    int perPage = 10,
  }) async {
    return await _photoGalleryRepository.fetchPhotoGallery(
      page: page,
      perPage: perPage,
    );
  }
}
