import 'package:flutter/material.dart';

import '../../../../../core/Text_Style/text_style.dart';
import '../../../../../core/const/width_height.dart';

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
    double width = WidthHeight.screenWidth(context);
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
          Padding(
            padding: const EdgeInsets.only(left:10.0,right: 10),
            child: Row(
              
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(width:width*0.418, child:TextStyles(text: '${title}', fontColor: Colors.black,fontWeight: FontWeight.w500, fontSizes: (width*0.04).toInt())),
                SizedBox(width: width * 0.15,child: Align(alignment:Alignment.centerRight,child: TextStyles(text: '\$$price', fontColor: Colors.black, fontSizes: 14))),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 10.0, right: 10,bottom: 30),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              
              children: [
                
                SizedBox(width:width*0.65,child: TextStyles(text: '$disc', fontColor: Colors.grey, fontSizes: (width*0.03).toInt())),
                const Spacer(),
                const Icon(Icons.star, color: Colors.yellow, size: 15),
                
                SizedBox(
                  
                  child: Align(
                    alignment:Alignment.centerRight,
                    child: TextStyles(
                      text: '(4.0)',
                      fontColor: Colors.grey,
                      fontSizes: 12,
                    ),
                  ),
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
