part of 'new_bloc.dart';

abstract class NewEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class NewFetched extends NewEvent {}
