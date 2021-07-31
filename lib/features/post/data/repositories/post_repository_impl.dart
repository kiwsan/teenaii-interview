import 'package:teenaii/core/network/rest_api_provider.dart';
import 'package:teenaii/features/post/domain/entities/post_entity.dart';
import 'package:teenaii/core/util/base_entity.dart';
import 'package:teenaii/features/post/domain/repositories/post_repository.dart';

class PostRepositoryImpl implements PostRepository {
  PostRepositoryImpl({required this.httpClient});

  final RestApiProvider httpClient;

  @override
  Future<BaseEntity<PostEntity>> fetchAsync() async {
    final body = await httpClient.get('/mobile/post-manager/posts');
    return BaseEntity.fromJson(body);
  }
}
