import 'package:flutter/material.dart';
import 'package:untitled1_pr_7_festival_app/utils/festival_utils.dart';
import 'package:untitled1_pr_7_festival_app/views/screens/festival_details.dart';
import 'package:untitled1_pr_7_festival_app/views/screens/home_page.dart';
import 'package:untitled1_pr_7_festival_app/views/screens/route_utils.dart';


void main(){
  runApp(
    MyApp(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
      ),
      routes: {
        MyRoutes.home:(context)=>const HomePage(),
        MyRoutes.DetailsPage:(context)=> const DetailsPage(),

      },
    );
  }
}