import 'package:flutter_bloc/flutter_bloc.dart';

import '../../models/app_lang.dart';
import '../../models/theme_type.dart';
import '../../repositories/common_repository.dart';
import 'app_state.dart';

class AppCubit extends Cubit<AppState> {
  final CommonRepository _commonRepository;

  AppCubit(this._commonRepository)
      : super(AppState(
          themeType: _commonRepository.getTheme(),
          appLang: _commonRepository.getAppLang(),
        ));

  void updateTheme(ThemeType theme) {
    _commonRepository.setTheme(theme);
    emit(state.copyWith(themeType: theme));
  }

  void updateAppLang(AppLang appLang) {
    _commonRepository.setAppLang(appLang);
    emit(state.copyWith(appLang: appLang));
  }
}
