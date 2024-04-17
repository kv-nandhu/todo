import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todolist_bloc/domain_layout/repository.dart';
import 'package:todolist_bloc/presentation/bloc_layout/delete_bloc/delete_bloc.dart';
import 'package:todolist_bloc/presentation/bloc_layout/edit_bloc/edit_bloc.dart';
import 'package:todolist_bloc/presentation/bloc_layout/fetch_bloc/fetch_bloc.dart';
import 'package:todolist_bloc/presentation/bloc_layout/post_bloc/post_bloc.dart';
import 'package:todolist_bloc/presentation/screen_layout/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider(create: (context) => FetchBlocBloc(HomeRepository())),
          BlocProvider(
            create: (context) => PostBlocBloc(HomeRepository()),
          ),
          BlocProvider(
            create: (context) => DeleteBloc(HomeRepository()),
          ),
          BlocProvider(
            create: (context) => EditBloc(HomeRepository()),
          ),
        ],
        child: MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Flutter Demo',
            theme: ThemeData(
              colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
              useMaterial3: true,
            ),
            home: HomeScreens()));
  }
}
