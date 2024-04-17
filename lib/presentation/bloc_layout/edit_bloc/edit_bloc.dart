// ignore_for_file: depend_on_referenced_packages

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:todolist_bloc/domain_layout/repository.dart';

part 'edit_event.dart';
part 'edit_state.dart';

class EditBloc extends Bloc<EditEvent, EditState> {
  HomeRepository rep;
  EditBloc(this.rep) : super(EditInitial()) {
    on<TodoEditEvent>((event, emit) async{
        rep.updateApi(event.id, event.title, event.description);
    });
  }
}
