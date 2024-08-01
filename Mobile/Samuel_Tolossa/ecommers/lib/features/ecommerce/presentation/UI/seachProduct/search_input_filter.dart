import 'package:flutter/material.dart';

class SearchInputFilter extends StatefulWidget {
  const SearchInputFilter({super.key});

  @override
  State<SearchInputFilter> createState() => _SearchInputFilterState();
}

class _SearchInputFilterState extends State<SearchInputFilter> {
  @override
  Widget build(BuildContext context) {
    return Row(
              children: [
                Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: 'Search',
                      enabledBorder: OutlineInputBorder(
                        borderSide: const BorderSide(
                          color: Colors.grey,
                        ),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      suffixIcon: const Icon(Icons.arrow_forward,color:Colors.blue,size: 30,),
                    ),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(left: 10),
                  width: 50,
                  height: 50,
                  decoration: BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: const Icon(Icons.filter_list,size: 30,color:Colors.white,)),
              ],
            );
  }
}