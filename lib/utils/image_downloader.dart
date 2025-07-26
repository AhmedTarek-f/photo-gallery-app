import 'dart:io';

import 'package:dio/dio.dart';
import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';

abstract class ImageDownloader {
  static final Dio _dio = Dio();

  static Future<String?> downloadAndSaveImage(String url) async {
    try {
      final dir = await getApplicationDocumentsDirectory();
      final fileName = p.basename(url);
      final filePath = p.join(dir.path, 'images', fileName);

      final imageDir = Directory(p.join(dir.path, 'images'));
      if (!imageDir.existsSync()) {
        imageDir.createSync(recursive: true);
      }

      final file = File(filePath);
      if (file.existsSync()) return file.path; // Already cached

      final response = await _dio.download(
        url,
        filePath,
        options: Options(responseType: ResponseType.bytes),
      );

      return response.statusCode == 200 ? filePath : null;
    } catch (e) {
      rethrow;
    }
  }
}
