import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:photo_gallery_app/core/constants/app_images.dart';
import 'package:photo_gallery_app/domain/entities/photo_entity.dart';
import 'package:photo_gallery_app/utils/common_widgets/shimmer/shimmer_effect.dart';

class PhotoItem extends StatelessWidget {
  const PhotoItem({super.key, required this.photoData});
  final PhotoEntity photoData;
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8.r),
        border: Border.all(
          color: theme.colorScheme.secondary.withValues(alpha: 0.4),
        ),
        boxShadow: [
          BoxShadow(
            color: theme.colorScheme.secondary,
            blurStyle: BlurStyle.outer,
            blurRadius: 5.r,
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadiusGeometry.circular(8.r),
        child: photoData.localOriginalPhotoPath != null
            ? Image.file(
                File(photoData.localOriginalPhotoPath!),
                fit: BoxFit.cover,
              )
            : CachedNetworkImage(
                imageUrl: photoData.originalPhotoUrl ?? "",
                fit: BoxFit.cover,
                alignment: Alignment.center,
                errorWidget: (context, url, error) =>
                    Image.asset(AppImages.noImage, fit: BoxFit.cover),
                progressIndicatorBuilder: (context, url, progress) =>
                    ShimmerEffect(width: 100, height: 100, radius: 8.r),
              ),
      ),
    );
  }
}
