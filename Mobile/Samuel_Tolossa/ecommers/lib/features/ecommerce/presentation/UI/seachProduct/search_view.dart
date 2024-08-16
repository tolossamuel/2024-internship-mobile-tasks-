import 'package:flutter/material.dart';

import '../home/product_image.dart';

class SearchView extends StatelessWidget {
  const SearchView({super.key});

  @override
  Widget build(BuildContext context) {
   
    return ListView.builder(
      itemCount: 3,
      itemBuilder: (context, index){
      return  const ProductImage(
        disc: 'search part',
        imageUrl: 'https://png.pngitem.com/pimgs/s/43-434027_product-beauty-skin-care-personal-care-liquid-tree.png',
        price: 300,
        title: 'Camera',
        id: '1234',
        );}
    );
  }
}
