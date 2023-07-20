import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/failure/failure.dart';
import '../../../core/mixins/cancelable_cubit_mixin.dart';
import '../../../core/result_type.dart';
import '../../models/product.dart';
import '../../repositories/product_repository.dart';
import 'get_products_state.dart';

class GetProductsCubit extends Cubit<GetProductsState>
    with CancelableCubitMixin {
  final ProductRepository _productRepository;

  GetProductsCubit(this._productRepository) : super(GetProductsStateLoading());

  void fetchProducts() async {
    emit(GetProductsStateLoading());
    final result = await toCancelable(_productRepository.getProducts());
    switch (result) {
      case TSuccess<List<Product>, Failure> e:
        emit(GetProductsStateSuccess(e.data));
      case TError<List<Product>, Failure> e:
        emit(GetProductsStateError(e.error));
    }
  }
}
