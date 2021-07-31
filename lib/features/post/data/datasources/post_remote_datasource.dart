import 'package:teenaii/core/network/rest_api_provider.dart';
import 'package:teenaii/core/util/base_entity.dart';
import 'package:teenaii/features/post/domain/entities/entities.dart';

abstract class PostRemoteDatasource {
  Future<BaseEntity<PostEntity>> fetchAsync();
}

class PostRemoteDatasourceImpl extends PostRemoteDatasource {
  PostRemoteDatasourceImpl({required this.httpClient});

  final RestApiProvider httpClient;

  @override
  Future<BaseEntity<PostEntity>> fetchAsync() async {
    final body = await httpClient.get('/mobile/post-manager/posts');
    return BaseEntity.fromJson(body);
  }
}
