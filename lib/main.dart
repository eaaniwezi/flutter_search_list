// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_search_list/bloc/dog_bloc.dart';
import 'package:flutter_search_list/repositories/dog_repository.dart';
import 'package:flutter_search_list/screens/home_screen.dart';

void main() {
  final dogRepository = DogRepository();
  runApp(MultiBlocProvider(
    providers: [
      BlocProvider<DogBloc>(create: (context) {
        return DogBloc(
          dogRepository: dogRepository,
          initialState: DogInitialState(),
        );
      }),
    ],
    child: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Dog Finder',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomeScreen(),
    );
  }
}
