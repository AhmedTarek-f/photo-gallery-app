import 'package:injectable/injectable.dart';
import 'package:photo_gallery_app/api/client/api_result.dart';
import 'package:photo_gallery_app/data/data_source/photo_gallery/local_data_source/photo_gallery_local_data_source.dart';
import 'package:photo_gallery_app/data/data_source/photo_gallery/remote_data_source/photo_gallery_remote_data_source.dart';
import 'package:photo_gallery_app/domain/entities/photo_entity.dart';
import 'package:photo_gallery_app/domain/repositories/photo_gallery/photo_gallery_repository.dart';
import 'package:photo_gallery_app/utils/connection_manager/connection_manager.dart';

@Injectable(as: PhotoGalleryRepository)
class PhotoGalleryRepositoryImpl implements PhotoGalleryRepository {
  final PhotoGalleryRemoteDataSource photoGalleryRemoteDataSource;
  final PhotoGalleryLocalDataSource photoGalleryLocalDataSource;
  @factoryMethod
  const PhotoGalleryRepositoryImpl({
    required this.photoGalleryRemoteDataSource,
    required this.photoGalleryLocalDataSource,
  });

  @override
  Future<Result<List<PhotoEntity>?>> fetchPhotoGallery({
    required int page,
    required int perPage,
  }) async {
    final bool connection = await ConnectionManager.checkConnection();
    if (connection) {
      return await photoGalleryRemoteDataSource.fetchPhotoGallery(
        page: page,
        perPage: perPage,
      );
    } else {
      return photoGalleryLocalDataSource.fetchPhotoGallery(
        page: page,
        perPage: perPage,
      );
    }
  }
}
