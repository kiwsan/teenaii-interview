part of 'category_bloc.dart';

class CategoryState extends Equatable {
  const CategoryState({
    this.status = CustomHttpStatus.initial,
    this.categories = const <CategoryEntity>[],
  });

  final CustomHttpStatus status;
  final List<CategoryEntity> categories;

  CategoryState copyWith({
    CustomHttpStatus? status,
    List<CategoryEntity>? categories,
  }) {
    return CategoryState(
      status: status ?? this.status,
      categories: categories ?? this.categories,
    );
  }

  @override
  String toString() {
    return '''State { status: $status, totals: ${categories.length} }''';
  }

  @override
  List<Object> get props => [status, categories];
}
