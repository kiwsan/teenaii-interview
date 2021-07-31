part of 'new_bloc.dart';

class NewState extends Equatable {
  const NewState({
    this.status = CustomHttpStatus.initial,
    this.news = const <NewEntity>[],
  });

  final CustomHttpStatus status;
  final List<NewEntity> news;

  NewState copyWith({
    CustomHttpStatus? status,
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
