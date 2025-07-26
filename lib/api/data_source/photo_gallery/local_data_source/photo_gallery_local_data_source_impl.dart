import 'package:hive/hive.dart';
import 'package:injectable/injectable.dart';
import 'package:photo_gallery_app/api/client/api_result.dart';
import 'package:photo_gallery_app/core/constants/const_keys.dart';
import 'package:photo_gallery_app/data/data_source/photo_gallery/local_data_source/photo_gallery_local_data_source.dart';
import 'package:photo_gallery_app/domain/entities/photo_entity.dart';

@Injectable(as: PhotoGalleryLocalDataSource)
class PhotoGalleryLocalDataSourceImpl implements PhotoGalleryLocalDataSource {
  @override
  Result<List<PhotoEntity>?> fetchPhotoGallery({
    required int page,
    required int perPage,
  }) {
    int startIndex = page * perPage;
    int endIndex = (page + 1) * perPage;
    var box = Hive.box<PhotoEntity>(ConstKeys.photosBox);
    int length = box.values.length;
    if (startIndex >= length || endIndex > length) {
      return Success([]);
    }
    return Success(box.values.toList().sublist(startIndex, endIndex));
  }
}
