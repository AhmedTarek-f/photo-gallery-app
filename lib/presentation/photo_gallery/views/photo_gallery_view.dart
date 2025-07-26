import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:photo_gallery_app/core/di/di.dart';
import 'package:photo_gallery_app/presentation/photo_gallery/views/widgets/photo_gallery_view_body.dart';
import 'package:photo_gallery_app/presentation/photo_gallery/views_model/photo_gallery_cubit.dart';
import 'package:photo_gallery_app/presentation/photo_gallery/views_model/photo_gallery_intent.dart';

class PhotoGalleryView extends StatelessWidget {
  const PhotoGalleryView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<PhotoGalleryCubit>(
      create: (context) =>
          getIt.get<PhotoGalleryCubit>()
            ..doIntent(intent: FetchPhotoGalleryIntent()),
      child: const Scaffold(body: SafeArea(child: PhotoGalleryViewBody())),
    );
  }
}
