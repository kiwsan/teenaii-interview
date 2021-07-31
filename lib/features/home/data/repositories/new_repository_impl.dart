import 'package:teenaii/core/network/network_info.dart';
import 'package:teenaii/core/util/base_entity.dart';
import 'package:teenaii/features/home/data/datasources/datasources.dart';
import 'package:teenaii/features/home/domain/entities/entities.dart';
import 'package:teenaii/features/home/domain/repositories/repositories.dart';

class NewRepositoryImpl implements NewRepository {
  NewRepositoryImpl(
      {required this.remote, required this.cached, required this.networkInfo});

  final NewRemoteDatasource remote;
  final NewLocalDatasource cached;
  final NetworkInfo networkInfo;

  @override
  Future<BaseEntity<NewEntity>> fetchAsync() async {
    final entity = await remote.fetchAsync();
    return entity;
  }
}
