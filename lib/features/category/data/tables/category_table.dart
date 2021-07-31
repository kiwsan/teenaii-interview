import 'package:hive/hive.dart';
import 'package:teenaii/features/category/domain/entities/entities.dart';

@HiveType(typeId: 0)
class CategoryTable extends CategoryEntity {
  @HiveField(0)
  final String id;

  @HiveField(1)
  final String name;

  CategoryTable({
    required this.id,
    required this.name,
  }) : super(
          id: id,
          name: name,
        );

  factory CategoryTable.fromMovieEntity(CategoryEntity entity) {
    return CategoryTable(
      id: entity.id,
      name: entity.name,
    );
  }
}
