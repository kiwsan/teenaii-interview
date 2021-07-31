import 'dart:async';
import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:http/http.dart' as http;
import 'package:rxdart/rxdart.dart';
import 'package:teenaii/core/util/base_entity.dart';
import 'package:teenaii/core/util/http_status.dart';
import 'package:teenaii/features/post/domain/entities/entities.dart';

part 'post_event.dart';
part 'post_state.dart';

class PostBloc extends Bloc<PostEvent, PostState> {
  PostBloc({required this.httpClient}) : super(const PostState());

  final http.Client httpClient;

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
      final response = await _fetchPosts();
      return response.success == false
          ? state.copyWith(status: CustomHttpStatus.failure, posts: [])
          : state.copyWith(
              status: CustomHttpStatus.success,
              posts: List.of(state.posts)
                ..addAll(response.data == null
                    ? const <PostEntity>[]
                    : response.data!.map((dynamic json) {
                        return PostEntity.fromJson(json);
                      }).toList()));
    } on Exception {
      return state.copyWith(status: CustomHttpStatus.failure);
    }
  }

  Future<BaseEntity> _fetchPosts([int startIndex = 0]) async {
    final response = await httpClient.get(
      Uri.https(
        'dev-api.teenaii.com',
        '/api/mobile/post-manager/posts',
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
