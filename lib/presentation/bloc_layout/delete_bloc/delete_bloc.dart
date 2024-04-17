// ignore_for_file: depend_on_referenced_packages

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:equatable/equatable.dart';
import 'package:todolist_bloc/domain_layout/repository.dart';

part 'delete_event.dart';
part 'delete_state.dart';

class DeleteBloc extends Bloc<DeleteEvent, DeleteState> {
HomeRepository rep;
  DeleteBloc(this.rep) : super(DeleteInitial()) {
    on<TodoDeleteEvent>((event, emit) {
 emit(DeleteInitial());
 rep.deleteApi(event.id);
    });
  }
}
