import 'package:flutter/material.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:path_provider/path_provider.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:to_do_bloc/data/to_do_bloc/to_do_bloc.dart';
import 'package:to_do_bloc/home.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  HydratedBloc.storage = await HydratedStorage.build(
      storageDirectory: await getTemporaryDirectory());
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Todo App',
        theme: ThemeData(
          brightness: Brightness.light,
          primaryColor: Colors.teal,
          primaryColorLight: Colors.teal[300],
          primaryColorDark: Colors.teal[700],
          colorScheme: ColorScheme.light(
            primary: Colors.teal,
            secondary: Colors.orange,
          ),
          buttonTheme: ButtonThemeData(
            buttonColor: Colors.teal,
            textTheme: ButtonTextTheme.primary,
          ),
          textTheme: TextTheme(
            bodyLarge: TextStyle(color: Colors.grey[800]),
            bodyMedium: TextStyle(color: Colors.grey[600]),
            headlineLarge: TextStyle(color: Colors.teal),
            headlineMedium: TextStyle(color: Colors.teal[700]),
            labelLarge: TextStyle(color: Colors.white),
          ),
          iconTheme: IconThemeData(
            color: Colors.teal,
          ),
          appBarTheme: AppBarTheme(
            color: Colors.teal,
          ),
        ),
        darkTheme: ThemeData(
          brightness: Brightness.dark,
          primaryColor: Colors.teal[800],
          primaryColorLight: Colors.teal[600],
          primaryColorDark: Colors.teal[900],
          colorScheme: ColorScheme.dark(
            primary: Colors.teal,
            secondary: Colors.orangeAccent,
          ),
          buttonTheme: ButtonThemeData(
            buttonColor: Colors.teal[800],
            textTheme: ButtonTextTheme.primary,
          ),
          textTheme: TextTheme(
            bodyLarge: TextStyle(color: Colors.grey[300]),
            bodyMedium: TextStyle(color: Colors.grey[400]),
            headlineLarge: TextStyle(color: Colors.teal[300]),
            headlineMedium: TextStyle(color: Colors.teal[100]),
            labelLarge: TextStyle(color: Colors.white),
          ),
          iconTheme: IconThemeData(
            color: Colors.teal[300],
          ),
          appBarTheme: AppBarTheme(
            color: Colors.teal[800],
          ),
        ),
        home: BlocProvider<TodoBloc>(
          create: (context) => TodoBloc()..add(TodoStarted()),
          child: HomeScreen(),
        ));
  }
}
