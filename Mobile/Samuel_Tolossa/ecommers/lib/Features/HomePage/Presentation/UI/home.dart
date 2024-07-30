import 'package:ecommers/Features/HomePage/Presentation/UI/header.dart';
import 'package:ecommers/Features/HomePage/Presentation/UI/productImage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          color: Colors.white,
          padding: const EdgeInsets.all(15),
          child: Column(
            children: [
              // Header part
              const HeaderPart(),
              // Body part
              const SizedBox(height: 20),
              Expanded(
                child: Container(
                  padding: const EdgeInsets.only(top: 5),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            "Available Products",
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Container(
                            width: 40,
                            height: 40,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: const Color.fromARGB(255, 248, 247, 247),
                              border: const Border(
                                top: BorderSide(
                                  color: Color.fromARGB(255, 226, 225, 225),
                                ),
                                right: BorderSide(
                                  color: Color.fromARGB(255, 226, 225, 225),
                                ),
                                left: BorderSide(
                                  color: Color.fromARGB(255, 226, 225, 225),
                                ),
                                bottom: BorderSide(
                                  color: Color.fromARGB(255, 226, 225, 225),
                                ),
                              ),
                            ),
                            child: const Icon(
                              Icons.search,
                              size: 30,
                              color: Color.fromARGB(255, 226, 225, 225),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 20),
                      const Expanded(child: ProductImage()),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
        floatingActionButton: Container(
          width: 60,
          height: 60,
          decoration: BoxDecoration(
            borderRadius:BorderRadius.circular(35),
            color: const Color.fromARGB(255, 33, 107, 243),


          ),
          child: const Icon(Icons.add,size: 40,color: Colors.white,),
        ),
      ),
    );
  }
}
