import 'package:e_commerce/pages/HomePage.dart';
import 'package:e_commerce/pages/ItemPage.dart';
import 'package:e_commerce/pages/ProfilePage.dart';
import 'package:e_commerce/pages/cartPage.dart';
import 'package:e_commerce/pages/chatPage.dart';
import 'package:e_commerce/widgets/Login.dart';
import 'package:e_commerce/widgets/RegisterPage.dart';
import 'package:flutter/material.dart';
// Removed duplicate imports from flutter_tutoriial

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(scaffoldBackgroundColor: Colors.white),
      routes: {
        "/": (context) => const Homepage(),
        "cartPage": (context) => const CartPage(),
        "itemPage": (context) =>  Itempage(),
        "Login": (context) =>  Login(),
        "Registerpage": (context) =>  Registerpage(),
        "ChatPage": (context) =>  Chatpage(),
         "Profilepage": (context) =>  Profilepage(),
        
      },
    );
  }
}
