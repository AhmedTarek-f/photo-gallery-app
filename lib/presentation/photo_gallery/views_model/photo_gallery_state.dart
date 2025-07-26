part of 'photo_gallery_cubit.dart';

sealed class PhotoGalleryState extends Equatable {
  const PhotoGalleryState();
}

final class PhotoGalleryInitial extends PhotoGalleryState {
  @override
  List<Object> get props => [];
}

final class FetchPhotoGallerySuccessState extends PhotoGalleryState {
  const FetchPhotoGallerySuccessState({required this.photosList});
  final List<PhotoEntity> photosList;
  FetchPhotoGallerySuccessState copyWith({List<PhotoEntity>? photosList}) {
    return FetchPhotoGallerySuccessState(
      photosList: photosList ?? this.photosList,
    );
  }

  @override
  List<Object> get props => [photosList];
}

final class FetchPhotoGalleryLoadingState extends PhotoGalleryState {
  @override
  List<Object> get props => [];
}

final class FetchNewPhotoGalleryLoadingState extends PhotoGalleryState {
  const FetchNewPhotoGalleryLoadingState({this.photosList});
  final List<PhotoEntity>? photosList;
  @override
  List<Object> get props => [];
}

final class FetchPhotoGalleryFailureState extends PhotoGalleryState {
  const FetchPhotoGalleryFailureState({required this.errorData});
  final ResponseException errorData;
  @override
  List<Object> get props => [errorData];
}
