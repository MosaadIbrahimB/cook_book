import 'package:cook_book/app/cook_book_app.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'app/bloc_obs.dart';

void main()async {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer=MyBlocObserver();
  runApp(const CookBookApp());
}




