import 'package:security_data/library/widgets/inherited/provider.dart';
import 'package:security_data/ui/widgets/labs/lab2/lab2_model.dart';
import 'package:security_data/ui/widgets/labs/lab2/lab2_widget.dart';
import 'package:security_data/ui/widgets/labs/lab3/lab3_model.dart';
import 'package:security_data/ui/widgets/labs/lab3/lab3_widget.dart';
import 'package:security_data/ui/widgets/labs/lab4/lab4_model.dart';
import 'package:security_data/ui/widgets/labs/lab4/lab4_widget.dart';
import 'package:security_data/ui/widgets/mainScreen.dart';
import 'package:security_data/ui/widgets/labs/lab1/lab1_widget.dart';
import 'package:security_data/ui/widgets/labs/lab1/lab1_model.dart';

class MainNavigationNameRoute {
  static const main = '/';
  static const lab1 = '/lab1';
  static const lab2 = '/lab2';
  static const lab3 = '/lab3';
  static const lab4 = '/lab4';
  // static const lab5 = '/lab5';
  // static const lab6 = '/lab6';
  // static const lab7 = '/lab7';
  // static const lab8 = '/lab8';
}

class MainNavigation {
  final routes = {
    MainNavigationNameRoute.main: (context) => const MainScreen(),
    MainNavigationNameRoute.lab1: (context) => NotifierProvider(
      create: () => Lab1Model(),
      child: const Lab1Widget(),
    ),
    MainNavigationNameRoute.lab2: (context) => NotifierProvider(
      child: const Lab2Widget(),
      create: () => Lab2Model(),
    ),
    MainNavigationNameRoute.lab3: (context) => NotifierProvider(
      child: const Lab3Widget(),
      create: () => Lab3Model(),
    ),
    MainNavigationNameRoute.lab4: (context) => NotifierProvider(
      child: const Lab4Widget(),
      create: () => Lab4Model(),
    ),
    // MainNavigationNameRoute.lab5: (context) => NotifierProvider(
    //   child: const Lab5Widget(),
    //   create: () => Lab5Model(),
    // ),
    // MainNavigationNameRoute.lab6: (context) => NotifierProvider(
    //   child: const Lab6Widget(),
    //   create: () => Lab6Model(),
    // ),
    // MainNavigationNameRoute.lab7: (context) => NotifierProvider(
    //   child: const Lab7Widget(),
    //   create: () => Lab7Model(),
    // ),
    // MainNavigationNameRoute.lab8: (context) => NotifierProvider(
    //   child: const Lab8Widget(),
    //   create: () => Lab8Model(),
    // ),
  };
  final initialRoute = MainNavigationNameRoute.main;
}
