import 'package:ecommers/Features/HomePage/Presentation/UI/header.dart';
import 'package:ecommers/Features/HomePage/Presentation/UI/product_image.dart';
import 'package:ecommers/core/Colors/colors.dart';
import 'package:ecommers/core/Text_Style/text_style.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.white,
        padding: const EdgeInsets.fromLTRB(15,25,15,15),
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
                        TextStyles(text: "Available Products",fontColor: mainText,fontSizes: 20,fontWeight: FontWeight.w600,),
                        GestureDetector(
                          onTap: () => {
                            Navigator.pushNamed(context, '/search')
                          },
                          child: Container(
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
                        ),
                      ],
                    ),
                   
                    const Expanded(child: ProductImage()),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: GestureDetector(
        onTap: () => {
          Navigator.pushNamed(context, '/add-product'),
        },
        child: Container(
          width: 60,
          height: 60,
          decoration: BoxDecoration(
            borderRadius:BorderRadius.circular(35),
            color: mainColor,
            
            
          ),
          child: const Icon(Icons.add,size: 40,color: Colors.white,),
        ),
      ),
    );
  }
}
