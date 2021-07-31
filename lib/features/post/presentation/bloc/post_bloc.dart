import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:rxdart/rxdart.dart';
import 'package:teenaii/core/util/custom_enums.dart';
import 'package:teenaii/features/post/domain/entities/entities.dart';
import 'package:teenaii/features/post/domain/repositories/repositories.dart';

part 'post_event.dart';
part 'post_state.dart';

class PostBloc extends Bloc<PostEvent, PostState> {
  PostBloc({required this.postRepository}) : super(const PostState());

  final PostRepository postRepository;

  @override
  Stream<Transition<PostEvent, PostState>> transformEvents(
    Stream<PostEvent> events,
    TransitionFunction<PostEvent, PostState> transitionFn,
  ) {
    return super.transformEvents(
      events.debounceTime(const Duration(milliseconds: 500)),
      transitionFn,
    );
  }

  @override
  Stream<PostState> mapEventToState(PostEvent event) async* {
    if (event is PostFetched) {
      yield await _mapPostFetchedToState(state);
    }
  }

  Future<PostState> _mapPostFetchedToState(PostState state) async {
    try {
      final response = await postRepository.fetchAsync();
      return response.success == false
          ? state.copyWith(status: CustomResponseStatus.failure, posts: [])
          : state.copyWith(
              status: CustomResponseStatus.success,
              posts: List.of(state.posts)
                ..addAll(response.data == null
                    ? const <PostEntity>[]
                    : response.data!.map((dynamic json) {
                        return PostEntity.fromJson(json);
                      }).toList()));
    } on Exception {
      return state.copyWith(status: CustomResponseStatus.failure);
    }
  }
}
