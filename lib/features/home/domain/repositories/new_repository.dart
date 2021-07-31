import 'package:teenaii/core/util/base_entity.dart';
import 'package:teenaii/features/home/domain/entities/entities.dart';

abstract class NewRepository {
  Future<BaseEntity<NewEntity>> fetchAsync();
}
