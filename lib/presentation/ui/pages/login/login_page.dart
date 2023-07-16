import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../di/di_init.dart';
import '../../../../domain/bloc/login/login_cubit.dart';
import 'login_view.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<LoginCubit>(
      create: (context) => getIt<LoginCubit>(),
      child: const LoginView(),
    );
  }
}
