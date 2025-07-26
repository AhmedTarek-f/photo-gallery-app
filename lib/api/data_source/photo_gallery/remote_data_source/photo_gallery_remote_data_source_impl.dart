import 'package:hive/hive.dart';
import 'package:injectable/injectable.dart';
import 'package:photo_gallery_app/api/client/api_client.dart';
import 'package:photo_gallery_app/api/client/api_result.dart';
import 'package:photo_gallery_app/core/constants/api_keys.dart';
import 'package:photo_gallery_app/core/constants/const_keys.dart';
import 'package:photo_gallery_app/data/data_source/photo_gallery/remote_data_source/photo_gallery_remote_data_source.dart';
import 'package:photo_gallery_app/domain/entities/photo_entity.dart';
import 'package:photo_gallery_app/utils/image_downloader.dart';

@Injectable(as: PhotoGalleryRemoteDataSource)
class PhotoGalleryRemoteDataSourceImpl implements PhotoGalleryRemoteDataSource {
  final ApiClient apiClient;
  @factoryMethod
  const PhotoGalleryRemoteDataSourceImpl({required this.apiClient});

  @override
  Future<Result<List<PhotoEntity>?>> fetchPhotoGallery({
    required int page,
    required int perPage,
  }) async {
    return executeApi(() async {
      final box = Hive.box<PhotoEntity>(ConstKeys.photosBox);
      var response = await apiClient.fetchPhotoGallery(
        page: page,
        perPage: perPage,
        apiKey: ApiKeys.pexelsKey,
      );
      var photoEntitiesList = response.photos
          ?.map((photo) => photo.toPhotoEntity())
          .toList();
      if (photoEntitiesList != null && photoEntitiesList.isNotEmpty) {
        for (var photo in photoEntitiesList) {
          if (photo.originalPhotoUrl != null) {
            photo.localOriginalPhotoPath =
                await ImageDownloader.downloadAndSaveImage(
                  photo.originalPhotoUrl!,
                );
            await box.put(photo.id, photo);
          }
        }
      }

      return photoEntitiesList;
    });
  }
}
