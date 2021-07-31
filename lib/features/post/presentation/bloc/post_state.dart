part of 'post_bloc.dart';

class PostState extends Equatable {
  const PostState({
    this.status = CustomResponseStatus.initial,
    this.posts = const <PostEntity>[],
  });

  final CustomResponseStatus status;
  final List<PostEntity> posts;

  PostState copyWith({
    CustomResponseStatus? status,
    List<PostEntity>? posts,
  }) {
    return PostState(
      status: status ?? this.status,
      posts: posts ?? this.posts,
    );
  }

  @override
  String toString() {
    return '''State { status: $status, totals: ${posts.length} }''';
  }

  @override
  List<Object> get props => [status, posts];
}
