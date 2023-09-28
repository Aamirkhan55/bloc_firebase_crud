import 'package:bloc_firebase_crud/bloc/bloc_firebase_crud_bloc.dart';
import 'package:bloc_firebase_crud/ui/screens/home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => BlocFirebaseCrudBloc()..add(ReadDataEvent()),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Bloc Crud',
        theme: ThemeData(
          primaryColor: Colors.deepPurple,
        ),
        home: const HomePage(),
      ),
    );
  }
}
