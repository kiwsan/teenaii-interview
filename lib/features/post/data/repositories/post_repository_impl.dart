import 'package:teenaii/core/network/network_info.dart';
import 'package:teenaii/features/post/data/datasources/datasources.dart';
import 'package:teenaii/core/util/base_entity.dart';
import 'package:teenaii/features/post/domain/entities/entities.dart';
import 'package:teenaii/features/post/domain/repositories/post_repository.dart';

class PostRepositoryImpl implements PostRepository {
  PostRepositoryImpl(
      {required this.remote, required this.cached, required this.networkInfo});

  final PostRemoteDatasource remote;
  final PostLocalDatasource cached;
  final NetworkInfo networkInfo;

  @override
  Future<BaseEntity<PostEntity>> fetchAsync() async {
    final entity = await remote.fetchAsync();
    return entity;
  }
}
