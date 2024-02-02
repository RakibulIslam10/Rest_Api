import 'package:flutter/material.dart';
import 'package:restapi/HomeScreen.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
      theme: ThemeData(
        iconTheme: const IconThemeData(color: Colors.white),
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.green,
          centerTitle: true,
          titleTextStyle: TextStyle(
              fontSize: 32, fontWeight: FontWeight.bold, color: Colors.white),
        ),
        floatingActionButtonTheme: const FloatingActionButtonThemeData(
          backgroundColor: Colors.green,
        ),
        inputDecorationTheme: const InputDecorationTheme(
          errorBorder:
          OutlineInputBorder(borderSide: BorderSide(color: Colors.red)),
          focusedBorder:
          OutlineInputBorder(borderSide: BorderSide(color: Colors.indigo)),
          disabledBorder:
          OutlineInputBorder(borderSide: BorderSide(color: Colors.teal)),
          enabledBorder:
          OutlineInputBorder(borderSide: BorderSide(color: Colors.teal)),
          border:
          OutlineInputBorder(borderSide: BorderSide(color: Colors.teal)),
          fillColor: Colors.white,
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.green,
            textStyle: const TextStyle(fontSize: 25),
          ),
        ),
      ),
    );
  }
}
