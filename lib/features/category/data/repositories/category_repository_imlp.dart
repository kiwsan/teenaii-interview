import 'package:teenaii/core/network/network_info.dart';
import 'package:teenaii/core/util/base_entity.dart';
import 'package:teenaii/features/category/data/datasources/category_local_data_source.dart';
import 'package:teenaii/features/category/data/datasources/datasources.dart';
import 'package:teenaii/features/category/domain/entities/entities.dart';
import 'package:teenaii/features/category/domain/repositories/category_repository.dart';

class CategoryRepositoryImpl implements CategoryRepository {
  CategoryRepositoryImpl(
      {required this.remote, required this.cached, required this.networkInfo});

  final CategoryRemoteDataSource remote;
  final CategoryLocalDataSource cached;
  final NetworkInfo networkInfo;

  @override
  Future<BaseEntity<CategoryEntity>> fetchAsync() async {
    final entity = await remote.fetchAsync();
    return entity;
  }
}
