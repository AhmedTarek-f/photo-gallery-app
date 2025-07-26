import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:photo_gallery_app/utils/common_widgets/shimmer/shimmer_effect.dart';

class PhotoItemShimmer extends StatelessWidget {
  const PhotoItemShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8.r),
        boxShadow: [
          BoxShadow(
            color: theme.colorScheme.secondary,
            blurStyle: BlurStyle.outer,
            blurRadius: 5.r,
          ),
        ],
      ),
      child: const ShimmerEffect(width: 50, height: 50),
    );
  }
}
