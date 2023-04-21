import 'package:flutter/material.dart';
import 'package:primeplay/screens/homepage.dart';

void main(){
  runApp(Myapp());
}
class Myapp extends StatelessWidget {
  const Myapp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "primeplay",
      debugShowCheckedModeBanner: false,
      theme: ThemeData(brightness: Brightness.dark,
      primaryColor: Colors.blue,),
      home: Homepage(),

      

    );
  }
}