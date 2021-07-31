import 'package:teenaii/features/category/domain/entities/entities.dart';

abstract class CategoryLocalDataSource {
  Future<CategoryEntity> fetch();
}
