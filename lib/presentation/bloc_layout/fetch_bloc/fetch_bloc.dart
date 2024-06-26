import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:equatable/equatable.dart';
import 'package:todolist_bloc/domain_layout/repository.dart';
import 'package:todolist_bloc/domain_layout/model.dart';

part 'fetch_event.dart';
part 'fetch_state.dart';

class FetchBlocBloc extends Bloc<FetchBlocEvent, FetchBlocState> {
  HomeRepository rep;
  FetchBlocBloc(this.rep) : super(FetchBlocInitial()) {
    on<FetchBlocEvent>((event, emit) async {
     emit(TodoLoadingState());

     try{
      print("try chayithu");
      final todo = await rep.fetchApi();
      print("try chayithu");
      emit(TodoLoadedState( todolist: todo));
     }catch(e) {
      emit(TodoErrorState(error: e.toString()));
     }
    });
  }
}
