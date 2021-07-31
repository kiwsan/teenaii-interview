import 'package:hive/hive.dart';
import 'package:teenaii/features/category/data/tables/tables.dart';
import 'package:teenaii/features/category/domain/entities/entities.dart';

abstract class CategoryLocalDataSource {
  Future<List<CategoryEntity>> fetchAsync();
  Future<void> add(CategoryTable entity);
  Future<void> remove(String id);
  Future<bool> ifExists(String id);
}

class CategoryLocalDataSourceImpl extends CategoryLocalDataSource {
  @override
  Future<List<CategoryEntity>> fetchAsync() async {
    final box = await Hive.openBox('categoryBox');
    final entity = box.keys;
    List<CategoryTable> categories = [];
    entity.forEach((item) {
      final category = box.get(item);
      if (category != null) {
        categories.add(box.get(item));
      }
    });
    return categories;
  }

  @override
  Future<void> add(CategoryTable entity) async {
    final box = await Hive.openBox('categoryBox');
    await box.put(entity.id, entity);
  }

  @override
  Future<bool> ifExists(String id) async {
    final box = await Hive.openBox('movieBox');
    return box.containsKey(id);
  }

  @override
  Future<void> remove(String id) async {
    final box = await Hive.openBox('movieBox');
    await box.delete(id);
  }
}
