import '../../domain/models/product.dart';
import '../models/product_entity.dart';

extension ProductMapper on ProductEntity {
  Product toDomain() => Product(id, title, description, thumbnail);
}
