import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:photo_gallery_app/core/constants/app_animations.dart';
import 'package:photo_gallery_app/core/constants/app_text.dart';
import 'package:photo_gallery_app/domain/entities/photo_entity.dart';
import 'package:photo_gallery_app/presentation/photo_gallery/views/widgets/photo_gallery_shimmer_grid.dart';
import 'package:photo_gallery_app/presentation/photo_gallery/views/widgets/photo_item.dart';
import 'package:photo_gallery_app/presentation/photo_gallery/views/widgets/photo_item_shimmer.dart';
import 'package:photo_gallery_app/presentation/photo_gallery/views_model/photo_gallery_cubit.dart';
import 'package:photo_gallery_app/utils/loaders/animation_loader_widget.dart';

class PhotoGalleryGridView extends StatelessWidget {
  const PhotoGalleryGridView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PhotoGalleryCubit, PhotoGalleryState>(
      buildWhen: (previous, current) =>
          current is FetchPhotoGallerySuccessState ||
          current is FetchPhotoGalleryLoadingState ||
          current is FetchPhotoGalleryFailureState,
      builder: (BuildContext context, PhotoGalleryState state) {
        if (state is FetchPhotoGalleryLoadingState) {
          return const PhotoGalleryShimmerGrid();
        } else if (state is FetchPhotoGallerySuccessState) {
          return SliverPadding(
            padding: EdgeInsets.all(16.r),
            sliver: BlocBuilder<PhotoGalleryCubit, PhotoGalleryState>(
              buildWhen: (previous, current) =>
                  current is FetchPhotoGallerySuccessState ||
                  current is FetchNewPhotoGalleryLoadingState,
              builder: (context, state2) {
                if (state2 is FetchNewPhotoGalleryLoadingState) {
                  return SliverGrid.builder(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      childAspectRatio: 1,
                      crossAxisSpacing: 12.r,
                      mainAxisSpacing: 12.r,
                    ),
                    itemBuilder: (context, index) {
                      if (index < state2.photosList!.length) {
                        return PhotoItem(
                          photoData: state2.photosList?[index] ?? PhotoEntity(),
                        );
                      } else {
                        return const PhotoItemShimmer();
                      }
                    },
                    itemCount: state2.photosList!.length + 10,
                  );
                } else if (state2 is FetchPhotoGallerySuccessState) {
                  return state2.photosList.isEmpty
                      ? const SliverFillRemaining(
                          child: AnimationLoaderWidget(
                            text: AppText.offlineAndNoDataMessage,
                            animation: AppAnimations.emptyFile,
                          ),
                        )
                      : SliverGrid.builder(
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2,
                                childAspectRatio: 1,
                                crossAxisSpacing: 12.r,
                                mainAxisSpacing: 12.r,
                              ),
                          itemBuilder: (context, index) =>
                              PhotoItem(photoData: state2.photosList[index]),
                          itemCount: state2.photosList.length,
                        );
                } else {
                  return const PhotoGalleryShimmerGrid();
                }
              },
            ),
          );
        } else {
          return const PhotoGalleryShimmerGrid();
        }
      },
    );
  }
}
