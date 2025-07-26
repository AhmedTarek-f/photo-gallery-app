// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i361;
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;

import '../../api/client/api_client.dart' as _i508;
import '../../api/client/api_module.dart' as _i272;
import '../../api/data_source/photo_gallery/local_data_source/photo_gallery_local_data_source_impl.dart'
    as _i294;
import '../../api/data_source/photo_gallery/remote_data_source/photo_gallery_remote_data_source_impl.dart'
    as _i488;
import '../../data/data_source/photo_gallery/local_data_source/photo_gallery_local_data_source.dart'
    as _i795;
import '../../data/data_source/photo_gallery/remote_data_source/photo_gallery_remote_data_source.dart'
    as _i783;
import '../../data/repositories/photo_gallery/photo_gallery_repository_impl.dart'
    as _i707;
import '../../domain/repositories/photo_gallery/photo_gallery_repository.dart'
    as _i92;
import '../../domain/use_cases/photo_gallery/photo_gallery_use_case.dart'
    as _i729;
import '../../presentation/photo_gallery/views_model/photo_gallery_cubit.dart'
    as _i965;

extension GetItInjectableX on _i174.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    final apiModule = _$ApiModule();
    gh.singleton<_i361.Dio>(() => apiModule.provideDio());
    gh.factory<_i508.ApiClient>(() => _i508.ApiClient(gh<_i361.Dio>()));
    gh.factory<_i795.PhotoGalleryLocalDataSource>(
        () => _i294.PhotoGalleryLocalDataSourceImpl());
    gh.factory<_i783.PhotoGalleryRemoteDataSource>(() =>
        _i488.PhotoGalleryRemoteDataSourceImpl(
            apiClient: gh<_i508.ApiClient>()));
    gh.factory<_i92.PhotoGalleryRepository>(() =>
        _i707.PhotoGalleryRepositoryImpl(
          photoGalleryRemoteDataSource:
              gh<_i783.PhotoGalleryRemoteDataSource>(),
          photoGalleryLocalDataSource: gh<_i795.PhotoGalleryLocalDataSource>(),
        ));
    gh.factory<_i729.PhotoGalleryUseCase>(
        () => _i729.PhotoGalleryUseCase(gh<_i92.PhotoGalleryRepository>()));
    gh.factory<_i965.PhotoGalleryCubit>(() => _i965.PhotoGalleryCubit(
        photoGalleryUseCase: gh<_i729.PhotoGalleryUseCase>()));
    return this;
  }
}

class _$ApiModule extends _i272.ApiModule {}
