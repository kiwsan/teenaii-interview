import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:rxdart/rxdart.dart';
import 'package:teenaii/core/util/custom_enums.dart';
import 'package:teenaii/features/home/domain/entities/new_entity.dart';
import 'package:teenaii/features/home/domain/repositories/repositories.dart';

part 'new_event.dart';
part 'new_state.dart';

class NewBloc extends Bloc<NewEvent, NewState> {
  NewBloc({required this.newRepository}) : super(const NewState());

  final NewRepository newRepository;

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
      final response = await newRepository.fetchAsync();
      return response.success == false
          ? state.copyWith(status: CustomResponseStatus.failure, news: [])
          : state.copyWith(
              status: CustomResponseStatus.success,
              news: List.of(state.news)
                ..addAll(response.data == null
                    ? const <NewEntity>[]
                    : response.data!.map((dynamic json) {
                        return NewEntity.fromJson(json);
                      }).toList()));
    } catch (e) {
      return state.copyWith(status: CustomResponseStatus.failure);
    }
  }
}
