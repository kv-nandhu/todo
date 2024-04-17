// ignore_for_file: must_be_immutable, override_on_non_overriding_member

part of 'fetch_bloc.dart';

@immutable
sealed class FetchBlocState {}

final class FetchBlocInitial extends FetchBlocState {}

class TodoLoadingState extends FetchBlocState {

@override
List<Object?> get props =>[];
}

class TodoLoadedState extends FetchBlocState {
  List<TodoModel> todolist = [];
TodoLoadedState({required this.todolist});

@override
List<Object> get props => [todolist];
}

class TodoErrorState extends FetchBlocState {
  String? error;
  TodoErrorState({this.error});

  @override
  List<Object?> get props => [error];
}