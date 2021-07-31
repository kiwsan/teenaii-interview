import 'package:teenaii/core/util/base_entity.dart';
import 'package:teenaii/features/post/domain/entities/entities.dart';

abstract class PostRepository {
  Future<BaseEntity<PostEntity>> fetchAsync();
}
