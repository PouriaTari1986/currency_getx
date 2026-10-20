import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:get/get.dart';

import 'package:new_learning/core/currency_text_them.dart';
import 'package:new_learning/currency_binding.dart';
import 'package:new_learning/features/presentation/pages/page1.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Currency App',

      initialBinding: CurrencyBinding(),
      home: MainPage(),

      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.blue,

        ),


        scaffoldBackgroundColor: const Color.fromARGB(
          255,
          243,
          243,
          243,
        ),
        textTheme: CurrencyTextThem.light,
        useMaterial3: true,
      ),

      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],

      supportedLocales: const [
        Locale('fa'),
      ],
    );
  }
}