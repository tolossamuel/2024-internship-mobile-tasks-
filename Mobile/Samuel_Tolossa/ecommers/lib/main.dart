// import 'package:ecommers/Features/AddProduct/Presentation/UI/addProduct.dart';
import 'package:ecommers/Presentation/UI/add_product/add_product.dart';
import 'package:ecommers/Presentation/UI/home/home.dart';
import 'package:ecommers/Presentation/UI/home/Product_detail/detail_page.dart';
import 'package:ecommers/Presentation/UI/seachProduct/search_screen.dart';
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
      initialRoute: "/",

      routes: {
        '/add-product' : (context) => const AddProduct(),
        '/detail' : (context) => const DetailPage(),
        '/search' : (context) => const SearchScreen(),
      },
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: "Poppins",
        colorScheme: ColorScheme.fromSeed(seedColor: const Color.fromARGB(255, 255, 255, 255)),
        useMaterial3: true,
      ),
      home: const HomeScreen(),
    );
  }
}

