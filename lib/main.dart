import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learn_bloc/bloc/color_product/color_product_bloc.dart';
import 'package:learn_bloc/bloc/home/home_bloc.dart';
import 'package:learn_bloc/bloc/user/user_bloc.dart';
import 'package:learn_bloc/page/home_screen.dart';
import 'package:learn_bloc/page/user_list_screen.dart';
import 'package:learn_bloc/repository/color_product_repository.dart';
import 'package:learn_bloc/repository/user_repository.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => HomeBloc()),
        BlocProvider(create: (context) => UserBloc(repository: UserRepository())),
        BlocProvider(create: (context) => ColorProductBloc(repository: ColorProductRepository()))
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: HomeScreen(),
      ),
    );
  }
}