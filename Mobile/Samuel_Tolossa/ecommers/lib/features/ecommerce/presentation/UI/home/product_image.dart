import 'package:flutter/material.dart';

import '../../../../../core/Text_Style/text_style.dart';

class ProductImage extends StatelessWidget {
  final String imageUrl;
  final double price;
  final String disc;
  final String title;
  final String id;

  const ProductImage({
    super.key,
    required this.disc,
    required this.imageUrl,
    required this.price,
    required this.title,
    required this.id
    });

  @override
  Widget build(BuildContext context) {
    int titles = 20 < title.length ? 20 : title.length;
    int discription = 30 < disc.length ? 30 : disc.length;
      return  GestureDetector(
        onTap: () => {
          Navigator.pushNamed(
            context, '/detail',
            arguments: {'disc':disc,'imageUrl':imageUrl,'price':price,'name':title,'id':id}
            )
        },
        child: Card(
      child: Column(
        children: [
          FadeInImage.assetNetwork(
            placeholder: 'assets/image/background.png',
            image: imageUrl,
            fit: BoxFit.fitWidth,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              TextStyles(text: '${title.substring(0,titles)}...', fontColor: Colors.black,fontWeight: FontWeight.w500, fontSizes: 20),
              TextStyles(text: '\$$price', fontColor: Colors.black, fontSizes: 14),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(left: 25.0, right: 25,bottom: 30),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                
                TextStyles(text: '${disc.substring(0,discription)}...', fontColor: Colors.grey, fontSizes: 12),
                const Spacer(),
                const Icon(Icons.star, color: Colors.yellow, size: 15),
                
                TextStyles(
                  text: '(4.0)',
                  fontColor: Colors.grey,
                  fontSizes: 12,
                )
              ],
            ),
          ),
        ],
      ),
    )
      );
  }
}
