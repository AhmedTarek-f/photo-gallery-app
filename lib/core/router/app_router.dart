import 'package:flutter/material.dart';

abstract class AppRouter {
  static Route<dynamic>? onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      // case RouteNames.gallery:
      //   return MaterialPageRoute(builder: (_) => const GalleryView());
      //
      // default:
      //   return MaterialPageRoute(builder: (_) => const GalleryView());
    }
  }
}
