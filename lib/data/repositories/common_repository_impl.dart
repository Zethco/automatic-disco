import '../../domain/models/app_lang.dart';
import '../../domain/models/theme_type.dart';
import '../../domain/repositories/common_repository.dart';
import '../preferences/preferences.dart';

class CommonRepositoryImpl implements CommonRepository {
  final Preferences _preferences;

  CommonRepositoryImpl(this._preferences);

  @override
  AppLang getAppLang() {
    final appLangStr = _preferences.getAppLang();
    if (appLangStr == null) return AppLang.en;
    return AppLang.fromName(appLangStr);
  }

  @override
  void setAppLang(AppLang lang) {
    _preferences.setAppLang(lang.name);
  }

  @override
  ThemeType getTheme() {
    final themeStatusStr = _preferences.getAppTheme();
    if (themeStatusStr == null) return ThemeType.light;
    return ThemeType.fromName(themeStatusStr);
  }

  @override
  void setTheme(ThemeType themeType) {
    _preferences.setAppTheme(themeType.name);
  }
}
