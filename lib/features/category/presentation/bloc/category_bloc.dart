import 'dart:async';
import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:http/http.dart' as http;
import 'package:rxdart/rxdart.dart';
import 'package:teenaii/core/util/base_entity.dart';
import 'package:teenaii/core/util/http_status.dart';
import 'package:teenaii/features/category/domain/entities/category_entity.dart';

part 'category_event.dart';
part 'category_state.dart';

class CategoryBloc extends Bloc<CategoryEvent, CategoryState> {
  CategoryBloc({required this.httpClient}) : super(const CategoryState());

  final http.Client httpClient;

  @override
  Stream<Transition<CategoryEvent, CategoryState>> transformEvents(
    Stream<CategoryEvent> events,
    TransitionFunction<CategoryEvent, CategoryState> transitionFn,
  ) {
    return super.transformEvents(
      events.debounceTime(const Duration(milliseconds: 500)),
      transitionFn,
    );
  }

  @override
  Stream<CategoryState> mapEventToState(CategoryEvent event) async* {
    if (event is CategoryFetched) {
      yield await _mapCategoryFetchedToState(state);
    }
  }

  Future<CategoryState> _mapCategoryFetchedToState(CategoryState state) async {
    try {
      final response = await _fetchCategories();
      return response.success == false
          ? state.copyWith(status: CustomHttpStatus.failure, categories: [])
          : state.copyWith(
              status: CustomHttpStatus.success,
              categories: List.of(state.categories)
                ..addAll(response.data == null
                    ? const <CategoryEntity>[]
                    : response.data!.map((dynamic json) {
                        return CategoryEntity.fromJson(json);
                      }).toList()));
    } on Exception {
      return state.copyWith(status: CustomHttpStatus.failure);
    }
  }

  Future<BaseEntity> _fetchCategories() async {
    final response = await httpClient.get(
      Uri.https(
        'dev-api.teenaii.com',
        '/api/mobile/post-manager/categories',
        // <String, String>{'_start': '$startIndex', '_limit': '$_postLimit'},
      ),
    );
    if (response.statusCode == 200) {
      final body = json.decode(response.body);
      return BaseEntity.fromJson(body);
    }
    throw Exception('error fetching posts');
  }
}
