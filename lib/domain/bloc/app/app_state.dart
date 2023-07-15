import '../../models/app_lang.dart';
import '../../models/theme_type.dart';

class AppState {
  final ThemeType themeType;
  final AppLang appLang;

  AppState({
    required this.themeType,
    required this.appLang,
  });

  AppState copyWith({
    ThemeType? themeType,
    AppLang? appLang,
  }) {
    return AppState(
      themeType: themeType ?? this.themeType,
      appLang: appLang ?? this.appLang,
    );
  }
}
