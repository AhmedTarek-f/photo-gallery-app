import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:photo_gallery_app/api/responses/photo_gallery_response/photo_gallery_response.dart';
import 'package:photo_gallery_app/core/constants/endpoints.dart';
import 'package:retrofit/retrofit.dart';

part 'api_client.g.dart';

@injectable
@RestApi()
abstract class ApiClient {
  @factoryMethod
  factory ApiClient(Dio dio) = _ApiClient;
  @GET(Endpoints.pexelsImages)
  Future<PhotoGalleryResponse> fetchPhotoGallery({
    @Header("Authorization") required String apiKey,
    @Query("page") required int page,
    @Query("per_page") required int perPage,
  });
}
