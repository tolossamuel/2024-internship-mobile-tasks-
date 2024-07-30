// import 'package:ecommers/Features/AddProduct/Presentation/UI/addProduct.dart';
import 'package:ecommers/Features/AddProduct/Presentation/UI/addProduct.dart';
import 'package:ecommers/Features/HomePage/Presentation/UI/home.dart';
import 'package:ecommers/Features/SearchProduct/Presentation/UI/Product_detail/detail_page.dart';
import 'package:ecommers/Features/SearchProduct/Presentation/UI/search_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    
    return MaterialApp(
      title: 'Ecommers',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: const Color.fromARGB(255, 255, 255, 255)),
        useMaterial3: true,
      ),
      home: const SearchScreen(),
    );
  }
}

