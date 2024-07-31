import 'package:ecommers/Features/HomePage/Presentation/UI/Product_detail/delete_update_button.dart';
import 'package:ecommers/Features/HomePage/Presentation/UI/Product_detail/description.dart';
import 'package:ecommers/Features/HomePage/Presentation/UI/Product_detail/size_of_product.dart';
import 'package:ecommers/core/Icons/back_icons.dart';
import 'package:ecommers/core/Colors/colors.dart';
import 'package:ecommers/core/Icons/star.dart';
import 'package:ecommers/core/Text_Style/text_style.dart';
import 'package:flutter/material.dart';


class DetailPage extends StatelessWidget {
  const DetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: PreferredSize(
        
        preferredSize:const Size.fromHeight(286), 
        child: Stack(
          children: [
            Container(
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("assets/image/image.png"),
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
                      
                      TextStyles(text: "Men's shoe", fontColor: smallText, fontSizes: 16),
                      const SizedBox(
                        height: 10,
                      ),
                      const Text(
                        "Deby Leather Shoes",
                        style:
                            TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
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
                         
                          TextStyles(text: "(4.0)",fontColor: smallText,fontSizes: 12,)
        
        
                        ],
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                        
                        TextStyles(text: "\$120", fontColor: mainText, fontSizes: 16)
                    ],
                  )
                ],
              ),
               const SizedBox(height: 15,),
               // size of product if avilable
              const Text("Size:", style: TextStyle(fontSize: 20,fontWeight: FontWeight.w400),),
              const SizedBox(height: 10,),
              const SizeOfProduct(),
              const SizedBox(height: 10,),
               const SizedBox(
                
                child:  Description(),
               
               ),
               const SizedBox(height: 10,),
               const Row(

                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  DeleteUpdateButton(text: "DELETE",bordColor: Colors.red,bottonColor: Colors.white,),
                  DeleteUpdateButton(text: "UPDATE",bordColor: Colors.blue,bottonColor: Colors.blue,),
                ],
               )
            ],
           
            
          ),
        ),
      ),
    );
  }
}