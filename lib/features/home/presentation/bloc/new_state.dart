part of 'new_bloc.dart';

class NewState extends Equatable {
  const NewState({
    this.status = CustomResponseStatus.initial,
    this.news = const <NewEntity>[],
  });

  final CustomResponseStatus status;
  final List<NewEntity> news;

  NewState copyWith({
    CustomResponseStatus? status,
    List<NewEntity>? news,
  }) {
    return NewState(
      status: status ?? this.status,
      news: news ?? this.news,
    );
  }

  @override
  String toString() {
    return '''State { status: $status, totals: ${news.length} }''';
  }

  @override
  List<Object> get props => [status, news];
}
