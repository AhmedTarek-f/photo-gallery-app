import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:internet_connection_checker_plus/internet_connection_checker_plus.dart';
import 'package:photo_gallery_app/api/client/api_result.dart';
import 'package:photo_gallery_app/domain/entities/photo_entity.dart';
import 'package:photo_gallery_app/domain/use_cases/photo_gallery/photo_gallery_use_case.dart';
import 'package:photo_gallery_app/presentation/photo_gallery/views_model/photo_gallery_intent.dart';
import 'package:photo_gallery_app/utils/exceptions/response_exception.dart';

part 'photo_gallery_state.dart';

@injectable
class PhotoGalleryCubit extends Cubit<PhotoGalleryState> {
  final PhotoGalleryUseCase photoGalleryUseCase;
  @factoryMethod
  PhotoGalleryCubit({required this.photoGalleryUseCase})
    : super(PhotoGalleryInitial());
  late final ScrollController? scrollController;
  StreamSubscription? _internetConnectionStreamSubscription;
  int page = 1;
  bool offlineMode = false;
  FetchPhotoGallerySuccessState _successState =
      const FetchPhotoGallerySuccessState(photosList: []);

  void doIntent({required PhotoGalleryIntent intent}) {
    switch (intent) {
      case FetchPhotoGalleryIntent():
        _onInit();
        break;
    }
  }

  void _onInit() {
    scrollController = ScrollController();
    _internetConnectionStreamSubscription = InternetConnection().onStatusChange
        .listen((event) {
          switch (event) {
            case InternetStatus.connected:
              offlineMode = false;
              fetchPhotoGallery();
              break;
            case InternetStatus.disconnected:
              offlineMode = true;
              fetchPhotoGallery();
              break;
          }
        });
    scrollController?.addListener(() {
      if (scrollController!.position.atEdge) {
        bool isTop = scrollController!.position.pixels == 0;
        if (!isTop && state is! FetchNewPhotoGalleryLoadingState) {
          page++;
          emit(
            FetchNewPhotoGalleryLoadingState(
              photosList: _successState.photosList,
            ),
          );
          fetchPhotoGallery();
        }
      }
    });
  }

  Future<void> fetchPhotoGallery() async {
    if (_successState.photosList.isEmpty) {
      emit(FetchPhotoGalleryLoadingState());
    }
    var result = await photoGalleryUseCase.invoke(page: page);
    if (isClosed) return;
    switch (result) {
      case Success<List<PhotoEntity>?>():
        List<PhotoEntity> oldPhotos = _successState.photosList;
        List<PhotoEntity> newPhotos = List.from(oldPhotos)
          ..addAll(result.data ?? []);
        _successState = _successState.copyWith(photosList: newPhotos);
        emit(_successState);
        break;
      case Failure<List<PhotoEntity>?>():
        emit(
          FetchPhotoGalleryFailureState(
            errorData:
                result.responseException ??
                ResponseException(status: 0, code: result.errorMessage),
          ),
        );
        break;
    }
  }

  @override
  Future<void> close() {
    scrollController?.dispose();
    _internetConnectionStreamSubscription?.cancel();
    return super.close();
  }
}
