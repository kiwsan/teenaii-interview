import 'package:teenaii/core/network/rest_api_provider.dart';
import 'package:teenaii/core/util/base_entity.dart';
import 'package:teenaii/features/home/domain/entities/entities.dart';

abstract class NewRemoteDatasource {
  Future<BaseEntity<NewEntity>> fetchAsync();
}

class NewRemoteDatasourceImpl extends NewRemoteDatasource {
  NewRemoteDatasourceImpl({required this.httpClient});

  final RestApiProvider httpClient;

  @override
  Future<BaseEntity<NewEntity>> fetchAsync() async {
    final body = await httpClient.get('/mobile/news-manager/news');
    return BaseEntity.fromJson(body);
  }
}
