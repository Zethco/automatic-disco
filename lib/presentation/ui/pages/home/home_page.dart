import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../di/di_init.dart';
import '../../../../domain/bloc/get_products/get_products_cubit.dart';
import 'home_view.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => getIt<GetProductsCubit>()..fetchProducts(),
      child: const HomeView(),
    );
  }
}
