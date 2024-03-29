import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../domain/bloc/app/app_cubit.dart';
import '../../../domain/models/theme_type.dart';

class AppThemeSwitch extends StatelessWidget {
  const AppThemeSwitch({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ThemeType theme = context.select<AppCubit, ThemeType>(
      (value) => value.state.themeType,
    );

    return Switch(
      value: theme == ThemeType.dark,
      activeTrackColor: Colors.grey,
      onChanged: (value) {
        context
            .read<AppCubit>()
            .updateTheme(value ? ThemeType.dark : ThemeType.light);
      },
    );
  }
}
