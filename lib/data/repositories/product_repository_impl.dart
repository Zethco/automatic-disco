import 'package:connectivity_plus/connectivity_plus.dart';

import '../../core/failure/failure.dart';
import '../../core/result_type.dart';
import '../../domain/models/product.dart';
import '../../domain/repositories/product_repository.dart';
import '../data_sources/remote/abstract/product_data_source.dart';
import '../mappers/product_mapper.dart';

class ProductRepositoryImpl implements ProductRepository {
  final ProductDataSource _productDataSource;

  ProductRepositoryImpl(this._productDataSource);

  @override
  Future<ResultType<List<Product>, Failure>> getProducts() async {
    final connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.none) {
      return TError(ConnectionFailure());
    }
    final productResult = await _productDataSource.getProducts();
    return productResult.mapSuccess(
      (products) => products.map((e) => e.toDomain()).toList(),
    );
  }
}
