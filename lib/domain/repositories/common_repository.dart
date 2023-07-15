import '../models/app_lang.dart';
import '../models/theme_type.dart';

abstract class CommonRepository {
  AppLang getAppLang();

  ThemeType getTheme();

  void setAppLang(AppLang lang);

  void setTheme(ThemeType themeStatus);
}
