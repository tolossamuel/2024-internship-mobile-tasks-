


import 'package:flutter/material.dart';

import 'search_input_filter.dart';
import 'search_view.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Search Product'),
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
      ),
    );
  }
}