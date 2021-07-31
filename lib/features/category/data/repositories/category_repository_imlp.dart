import 'package:teenaii/core/network/rest_api_provider.dart';
import 'package:teenaii/core/util/base_entity.dart';
import 'package:teenaii/features/category/domain/entities/entities.dart';
import 'package:teenaii/features/category/domain/repositories/category_repository.dart';

class CategoryRepositoryImpl implements CategoryRepository {
  CategoryRepositoryImpl({required this.httpClient});

  final RestApiProvider httpClient;

  @override
  Future<BaseEntity<CategoryEntity>> fetchAsync() async {
    final body = await httpClient.get('/mobile/post-manager/categories');
    return BaseEntity.fromJson(body);
  }
}
