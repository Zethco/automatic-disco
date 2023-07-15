import '../models/product_entity.dart';
import '../../domain/models/product.dart';

extension ProductMapper on ProductEntity {
  Product toDomain() => Product(id, title, description, thumbnail);
}
