import 'package:flutter/material.dart';

import '../../../../../../core/Colors/colors.dart';
import '../../../../../../core/Icons/back_icons.dart';
import '../../../../../../core/Icons/star.dart';
import '../../../../../../core/Text_Style/text_style.dart';
import 'delete_update_button.dart';
import 'description.dart';
import 'size_of_product.dart';


class DetailPage extends StatelessWidget {
 
  const DetailPage({
    super.key,
    });

  @override
  Widget build(BuildContext context) {
    final Map<String, dynamic> data = ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
    final int titles = 20 < data['name'].length ? 20 : data['name'].length;
    return  Scaffold(
      appBar: PreferredSize(
        
        preferredSize:const Size.fromHeight(286), 
        child: Stack(
          children: [
            Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(data['imageUrl']),
                  fit: BoxFit.fill
                )
              ),
            ),
            const BackIcons()
          ],
        ),
        
        ),
      body: SingleChildScrollView(
      
        child: Container(
          color: Colors.white,
          padding: const  EdgeInsets.all(15),
          child:   Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // short description about the product price, rating and name of brand= ====================
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      
                      
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        '${data['name'].substring(0,titles)}...',
                        style:
                            const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                    ],
                    
                  ),
                  Column(
                    // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Star(),
                         
                          TextStyles(text: '(4.0)',fontColor: smallText,fontSizes: 12,)
        
        
                        ],
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                        
                        TextStyles(text: '\$${data["price"]}', fontColor: mainText, fontSizes: 16)
                    ],
                  )
                ],
              ),
               const SizedBox(height: 15,),
               // size of product if avilable
              const Text('Size:', style: TextStyle(fontSize: 20,fontWeight: FontWeight.w400),),
              const SizedBox(height: 10,),
              const SizeOfProduct(),
              const SizedBox(height: 10,),
              SizedBox(
                
                child:  Description(text:data['disc']),
               
               ),
               const SizedBox(height: 10,),
              Row(

                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  DeleteUpdateButton(
                    id: data['id'],
                    text: 'DELETE',bordColor: Colors.red,bottonColor: Colors.white,),
                  DeleteUpdateButton(
                    imageUrl:data['imageUrl'],
                  id: data['id'],
                  name: data['name'],
                  price: data['price'],
                  disc: data['disc'],
                  text: 'UPDATE',bordColor: Colors.blue,bottonColor: Colors.blue,),
                ],
               )
            ],
           
            
          ),
        ),
      ),
    );
  }
}