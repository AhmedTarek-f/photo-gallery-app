import 'package:flutter/material.dart';
import 'package:photo_gallery_app/core/router/route_names.dart';
import 'package:photo_gallery_app/presentation/photo_gallery/views/photo_gallery_view.dart';

abstract class AppRouter {
  static Route<dynamic>? onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RouteNames.photoGallery:
        return MaterialPageRoute(builder: (_) => const PhotoGalleryView());

      default:
        return MaterialPageRoute(builder: (_) => const PhotoGalleryView());
    }
  }
}
