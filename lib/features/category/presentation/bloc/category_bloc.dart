import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:rxdart/rxdart.dart';
import 'package:teenaii/core/util/custom_enums.dart';
import 'package:teenaii/features/category/domain/entities/category_entity.dart';
import 'package:teenaii/features/category/domain/repositories/category_repository.dart';

part 'category_event.dart';
part 'category_state.dart';

class CategoryBloc extends Bloc<CategoryEvent, CategoryState> {
  CategoryBloc({required this.categoryRepository})
      : super(const CategoryState());

  final CategoryRepository categoryRepository;

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
      final response = await categoryRepository.fetchAsync();
      return response.success == false
          ? state.copyWith(status: CustomResponseStatus.failure, categories: [])
          : state.copyWith(
              status: CustomResponseStatus.success,
              categories: List.of(state.categories)
                ..addAll(response.data == null
                    ? const <CategoryEntity>[]
                    : response.data!.map((dynamic json) {
                        return CategoryEntity.fromJson(json);
                      }).toList()));
    } catch (e) {
      return state.copyWith(status: CustomResponseStatus.failure);
    }
  }
}
