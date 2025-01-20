import 'package:bloc/bloc.dart';
import 'package:cook_book/feature/add/presentation/add_screen.dart';
import 'package:cook_book/feature/favorite/favorite_screen.dart';
import 'package:cook_book/feature/home/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LayOutCubit extends Cubit <int>{
  LayOutCubit():super(0);
  static LayOutCubit get(context)=>BlocProvider.of(context);
int index=0;
  List<Widget> screen = [
    const HomeScreen(),
    const FavScreen(),
    const AddScreen()
  ];
 changeIndex({int i = 0}){
    emit(i);
  }



}


abstract class LayOutState{}