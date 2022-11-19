import 'package:flutter/material.dart';
import 'package:security_data/ui/navigation/main_navigation.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final navigation = MainNavigation();
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: navigation.initialRoute,
      routes: navigation.routes,
    );
  }
}