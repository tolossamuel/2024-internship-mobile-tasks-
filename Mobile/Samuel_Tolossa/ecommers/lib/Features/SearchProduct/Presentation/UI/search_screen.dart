


import 'package:ecommers/Features/SearchProduct/Presentation/UI/search_input_filter.dart';
import 'package:ecommers/Features/SearchProduct/Presentation/UI/search_view.dart';
import 'package:flutter/material.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Search Product"),
        centerTitle: true,
        leading: GestureDetector(
          onTap: () => {
            Navigator.pop(context),
          },
          child: Container(
            width: 10,
            height: 10,
            margin: const EdgeInsets.only(left: 10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30),
              color: Colors.white
            ),
            child: const Icon(Icons.arrow_back_ios_new,color: Colors.blue,),
          ),
        ),
      ),
      body: Container(
        padding: const EdgeInsets.fromLTRB(20,15,20,10),
        child : const Column(
          children: [
            SearchInputFilter(),
            SizedBox(height: 25,),
            Expanded(
              child: SearchView(),
            ),
          ],
        )
      ),
    );
  }
}