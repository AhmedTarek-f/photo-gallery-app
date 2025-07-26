import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:photo_gallery_app/presentation/photo_gallery/views/widgets/photo_item_shimmer.dart';

class PhotoGalleryShimmerGrid extends StatelessWidget {
  const PhotoGalleryShimmerGrid({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverPadding(
      padding: EdgeInsets.all(16.r),
      sliver: SliverGrid.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 1,
          mainAxisSpacing: 12.r,
          crossAxisSpacing: 12.r,
        ),
        itemBuilder: (context, index) => const PhotoItemShimmer(),
        itemCount: 16,
      ),
    );
  }
}
