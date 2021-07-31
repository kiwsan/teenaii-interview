import 'dart:async';
import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:http/http.dart' as http;
import 'package:rxdart/rxdart.dart';
import 'package:teenaii/core/util/base_entity.dart';
import 'package:teenaii/core/util/http_status.dart';
import 'package:teenaii/features/home/domain/entities/new_entity.dart';

part 'new_event.dart';
part 'new_state.dart';

class NewBloc extends Bloc<NewEvent, NewState> {
  NewBloc({required this.httpClient}) : super(const NewState());

  final http.Client httpClient;

  @override
  Stream<Transition<NewEvent, NewState>> transformEvents(
    Stream<NewEvent> events,
    TransitionFunction<NewEvent, NewState> transitionFn,
  ) {
    return super.transformEvents(
      events.debounceTime(const Duration(milliseconds: 500)),
      transitionFn,
    );
  }

  @override
  Stream<NewState> mapEventToState(NewEvent event) async* {
    if (event is NewFetched) {
      yield await _mapPostFetchedToState(state);
    }
  }

  Future<NewState> _mapPostFetchedToState(NewState state) async {
    try {
      final response = await _fetchNews();
      return response.success == false
          ? state.copyWith(status: CustomHttpStatus.failure, news: [])
          : state.copyWith(
              status: CustomHttpStatus.success,
              news: List.of(state.news)
                ..addAll(response.data == null
                    ? const <NewEntity>[]
                    : response.data!.map((dynamic json) {
                        return NewEntity.fromJson(json);
                      }).toList()));
    } on Exception {
      return state.copyWith(status: CustomHttpStatus.failure);
    }
  }

  Future<BaseEntity> _fetchNews([int startIndex = 0]) async {
    final response = await httpClient.get(
      Uri.https(
        'dev-api.teenaii.com',
        '/api/mobile/news-manager/news',
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
