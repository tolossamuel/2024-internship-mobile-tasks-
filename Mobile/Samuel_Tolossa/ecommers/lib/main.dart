// import 'package:ecommers/Features/AddProduct/Presentation/UI/addProduct.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'features/ecommerce/presentation/UI/add_product/add_product.dart';
import 'features/ecommerce/presentation/UI/home/Product_detail/detail_page.dart';
import 'features/ecommerce/presentation/UI/home/home.dart';
import 'features/ecommerce/presentation/UI/seachProduct/search_screen.dart';
import 'features/ecommerce/presentation/state/product_bloc/product_bloc.dart';
import 'injection.dart' as di;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await di.SetUpLocator();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => di.locator<ProductBloc>(),
      child: MaterialApp(
        title: 'Ecommers',
        initialRoute: '/',
        routes: {
          '/add-product': (context) => const AddProduct(),
          '/detail': (context) => const DetailPage(),
          '/search': (context) => const SearchScreen(),
        },
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(
              seedColor: const Color.fromARGB(255, 255, 255, 255)),
          useMaterial3: true,
        ),
        home: const HomeScreen(),
      ),
    );
  }
}
