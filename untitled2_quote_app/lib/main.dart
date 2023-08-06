import 'package:flutter/material.dart';
import 'package:untitled2_quote_app/utils/quote_utils.dart';
import 'package:untitled2_quote_app/views/screens/home_page.dart';
import 'package:untitled2_quote_app/views/screens/quote_details.dart';

void main(){
  runApp(
    MyApp(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        
      ),

      routes: {
        MyRoutes.home:(context) => const HomePage(),
        MyRoutes.QuoteDetails:(context)=>  QuoteDetails(),
      },
    );
  }
}
