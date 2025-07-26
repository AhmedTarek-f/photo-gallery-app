import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';
import 'package:photo_gallery_app/core/cache/shared_preferences_helper.dart';
import 'package:photo_gallery_app/core/constants/const_keys.dart';
import 'package:photo_gallery_app/core/di/di.dart';
import 'package:photo_gallery_app/domain/entities/photo_entity.dart';
import 'package:photo_gallery_app/my_bloc_observer.dart';
import 'package:photo_gallery_app/photo_gallery_app.dart';
import 'package:photo_gallery_app/presentation/common/start/presentation/views_model/start_cubit.dart';

void main() async {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  final dir = await getApplicationDocumentsDirectory();
  Hive.init(dir.path);
  Hive.registerAdapter(PhotoEntityAdapter());
  await Hive.openBox<PhotoEntity>(ConstKeys.photosBox);
  await ScreenUtil.ensureScreenSize();
  await SharedPreferencesHelper.init();
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  Bloc.observer = MyBlocObserver();
  configureDependencies();
  FlutterNativeSplash.remove();
  runApp(
    BlocProvider<StartCubit>(
      create: (context) => StartCubit(),
      child: const PhotoGalleryApp(),
    ),
  );
}
