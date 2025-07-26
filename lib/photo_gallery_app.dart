import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:photo_gallery_app/core/app_theme.dart';
import 'package:photo_gallery_app/core/router/app_router.dart';
import 'package:photo_gallery_app/core/router/route_names.dart';
import 'package:photo_gallery_app/presentation/common/start/presentation/views_model/start_cubit.dart';
import 'package:photo_gallery_app/presentation/common/start/presentation/views_model/start_state.dart';

class PhotoGalleryApp extends StatelessWidget {
  const PhotoGalleryApp({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = BlocProvider.of<StartCubit>(context);
    return ScreenUtilInit(
      designSize: const Size(393, 841),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) => BlocBuilder<StartCubit, StartState>(
        buildWhen: (previous, current) => current is ChangeThemeIndexState,
        builder: (context, state) => MaterialApp(
          title: 'Photo Gallery',
          debugShowCheckedModeBanner: false,
          theme: AppTheme.lightTheme,
          darkTheme: AppTheme.darkTheme,
          themeMode: controller.isDarkMode ? ThemeMode.dark : ThemeMode.light,
          onGenerateRoute: AppRouter.onGenerateRoute,
          initialRoute: RouteNames.photoGallery,
        ),
      ),
    );
  }
}
