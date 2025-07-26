import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:photo_gallery_app/core/constants/app_colors.dart';
import 'package:photo_gallery_app/core/constants/app_icons.dart';
import 'package:photo_gallery_app/core/constants/app_images.dart';
import 'package:photo_gallery_app/core/constants/app_text.dart';
import 'package:photo_gallery_app/presentation/common/start/presentation/views_model/start_cubit.dart';
import 'package:photo_gallery_app/presentation/common/start/presentation/views_model/start_state.dart';
import 'package:photo_gallery_app/presentation/photo_gallery/views_model/photo_gallery_cubit.dart';
import 'package:photo_gallery_app/utils/common_widgets/custom_toggle_switch.dart';

class PhotoGalleryAppBar extends StatelessWidget {
  const PhotoGalleryAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final bool isDarkMode = theme.colorScheme.brightness == Brightness.dark;
    final startController = BlocProvider.of<StartCubit>(context);
    final controller = BlocProvider.of<PhotoGalleryCubit>(context);
    return RPadding(
      padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 8),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Image.asset(
                isDarkMode ? AppImages.routeLogoDark : AppImages.routeLogoLight,
                width: 120.w,
                fit: BoxFit.contain,
              ),
              BlocBuilder<StartCubit, StartState>(
                buildWhen: (previous, current) =>
                    current is ChangeThemeIndexState,
                builder: (context, state) => CustomToggleSwitch(
                  currentIndex: startController.themeSelectedIndex,
                  firstIcon: AppIcons.sun,
                  secondIcon: AppIcons.moon,
                  secondIconColor: const ColorFilter.mode(
                    AppColors.blue,
                    BlendMode.srcIn,
                  ),
                  onIndexChanged: (index) async =>
                      await startController.onThemeIndexChanged(index: index),
                ),
              ),
            ],
          ),
          BlocBuilder<PhotoGalleryCubit, PhotoGalleryState>(
            buildWhen: (previous, current) =>
                current is FetchPhotoGallerySuccessState ||
                current is FetchPhotoGalleryFailureState,
            builder: (context, state) => Visibility(
              visible: controller.offlineMode,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  const RSizedBox(height: 4),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Container(
                        width: 8.r,
                        height: 8.r,
                        decoration: const BoxDecoration(
                          color: AppColors.red,
                          shape: BoxShape.circle,
                        ),
                      ),
                      Text(
                        AppText.offlineMode,
                        style: theme.textTheme.bodyLarge?.copyWith(
                          color: theme.colorScheme.secondary,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
