import 'package:shared_preferences/shared_preferences.dart';
import 'package:weewx_now_app/util/constants.dart';

abstract class ThemeDataSource {
  Future<String?> readThemeMode();
  Future writeThemeMode(String? themeMode);
}

class ThemeDataSourceImpl extends ThemeDataSource {
  @override
  Future<String?> readThemeMode() async {
    return (await SharedPreferences.getInstance()).getString(kSharedPrefKeyThemeMode);
  }

  @override
  Future writeThemeMode(String? themeMode) async {
    if (themeMode == null) {
      (await SharedPreferences.getInstance()).remove(kSharedPrefKeyThemeMode);
    } else {
      (await SharedPreferences.getInstance()).setString(kSharedPrefKeyThemeMode, themeMode.toString());
    }
  }
}
