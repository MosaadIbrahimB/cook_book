import 'package:cook_book/feature/add/cubit/add_cubit.dart';
import 'package:cook_book/feature/add/cubit/image_cubit.dart';
import 'package:cook_book/feature/favorite/cubit/fav_cubit.dart';
import 'package:cook_book/feature/home/presentation/cubit/home_cubit.dart';
import 'package:cook_book/feature/layout/presentation/layout_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../feature/layout/presentation/control/layout_cubit.dart';

class CookBookApp extends StatelessWidget {
  const CookBookApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => AddCubit()),
        BlocProvider(create: (context) => LayOutCubit()),
        BlocProvider(create: (context) => HomeCubit()..getRecipe()),
        BlocProvider(create: (context) => ImageCubit()),
        BlocProvider(create: (context) => FavCubit()..getFvaRecipe()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'CookBook',
        theme: ThemeData(
          primarySwatch: Colors.orange,
          textTheme: const TextTheme(
            titleLarge: TextStyle(
                fontFamily: 'Arial', fontWeight: FontWeight.bold, fontSize: 18),
          ),
          scaffoldBackgroundColor:
              const Color(0xFFFFF8DC), // cornsilk background
        ),
        home: const LayoutScreen(),
      ),
    );
  }
}
