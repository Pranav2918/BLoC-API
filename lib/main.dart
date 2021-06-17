import 'package:blocwithapi/bloc/food_bloc.dart';
import 'package:blocwithapi/data/repositories/food_repository.dart';
import 'package:blocwithapi/ui/homepage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.teal,
      ),
      home: BlocProvider(
        create: (context) => FoodBloc(repository: FoodRepositoryImpl()),
        child: HomePage(),
      ),
    );
  }
}
