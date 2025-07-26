import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:photo_gallery_app/core/cache/shared_preferences_helper.dart';
import 'package:photo_gallery_app/core/constants/const_keys.dart';
import 'package:photo_gallery_app/presentation/common/start/presentation/views_model/start_state.dart';

class StartCubit extends Cubit<StartState> {
  StartCubit() : super(StartInitial()) {
    onInit();
  }
  late int themeSelectedIndex;
  late bool isDarkMode;

  void onInit() {
    isDarkMode = SharedPreferencesHelper.getBool(key: ConstKeys.isDarkTheme);
    themeSelectedIndex = isDarkMode ? 1 : 0;
  }

  Future<void> onThemeIndexChanged({required int index}) async {
    if (themeSelectedIndex != index && index == 0) {
      themeSelectedIndex = index;
      await SharedPreferencesHelper.saveBool(
        key: ConstKeys.isDarkTheme,
        value: false,
      );
      isDarkMode = false;
      emit(ChangeThemeIndexState());
    } else if (themeSelectedIndex != index && index == 1) {
      themeSelectedIndex = index;
      await SharedPreferencesHelper.saveBool(
        key: ConstKeys.isDarkTheme,
        value: true,
      );
      isDarkMode = true;
      emit(ChangeThemeIndexState());
    }
  }
}
