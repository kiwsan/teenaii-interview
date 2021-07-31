import 'package:teenaii/core/util/base_entity.dart';
import 'package:teenaii/features/category/domain/entities/entities.dart';

abstract class CategoryRepository {
  Future<BaseEntity<CategoryEntity>> fetchAsync();
}
