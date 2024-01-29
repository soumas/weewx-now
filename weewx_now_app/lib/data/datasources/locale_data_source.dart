import 'package:shared_preferences/shared_preferences.dart';
import 'package:weewx_now_app/util/constants.dart';

abstract class LocaleDataSource {
  Future<String?> readLocale();
  Future writeLocale(String? locale);
}

class LocaleDataSourceImpl extends LocaleDataSource {
  @override
  Future<String?> readLocale() async {
    return (await SharedPreferences.getInstance()).getString(kSharedPrefKeyLocale);
  }

  @override
  Future writeLocale(String? locale) async {
    if (locale == null) {
      (await SharedPreferences.getInstance()).remove(kSharedPrefKeyLocale);
    } else {
      (await SharedPreferences.getInstance()).setString(kSharedPrefKeyLocale, locale);
    }
  }
}
