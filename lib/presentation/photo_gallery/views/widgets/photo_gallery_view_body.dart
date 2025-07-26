import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:photo_gallery_app/presentation/photo_gallery/views/widgets/photo_gallery_app_bar.dart';
import 'package:photo_gallery_app/presentation/photo_gallery/views/widgets/photo_gallery_grid_view.dart';
import 'package:photo_gallery_app/presentation/photo_gallery/views_model/photo_gallery_cubit.dart';
import 'package:photo_gallery_app/utils/loaders/loaders.dart';

class PhotoGalleryViewBody extends StatelessWidget {
  const PhotoGalleryViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = BlocProvider.of<PhotoGalleryCubit>(context);
    return BlocListener<PhotoGalleryCubit, PhotoGalleryState>(
      listener: (context, state) {
        if (state is FetchPhotoGalleryFailureState) {
          Loaders.showErrorMessage(
            message: state.errorData.code,
            context: context,
          );
        }
      },
      child: CustomScrollView(
        controller: controller.scrollController,
        physics: const BouncingScrollPhysics(),
        slivers: const [
          SliverToBoxAdapter(child: PhotoGalleryAppBar()),
          PhotoGalleryGridView(),
        ],
      ),
    );
  }
}
