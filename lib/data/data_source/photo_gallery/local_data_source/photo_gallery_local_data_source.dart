import 'package:photo_gallery_app/api/client/api_result.dart';
import 'package:photo_gallery_app/domain/entities/photo_entity.dart';

abstract class PhotoGalleryLocalDataSource {
  Result<List<PhotoEntity>?> fetchPhotoGallery({
    required int page,
    required int perPage,
  });
}
