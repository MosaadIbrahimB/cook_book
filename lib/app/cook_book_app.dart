import 'package:cook_book/feature/layout/presentation/control/home_cubit.dart';
import 'package:cook_book/feature/layout/presentation/layout_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../feature/add/presentation/add_screen.dart';

class CookBookApp extends StatelessWidget {
  const CookBookApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeCubit()..getRecipes("Appetizers"),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'CookBook',
        theme: ThemeData(
          primarySwatch: Colors.orange,
          textTheme: const TextTheme(
            titleLarge: TextStyle(
                fontFamily: 'Arial', fontWeight: FontWeight.bold, fontSize: 18),
          ),
          scaffoldBackgroundColor: const Color(
              0xFFFFF8DC), // cornsilk background
        ),
        home: AddScreen(),
      ),
    );
  }
}
