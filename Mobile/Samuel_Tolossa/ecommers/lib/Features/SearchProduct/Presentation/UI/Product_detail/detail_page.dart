import 'package:ecommers/Features/SearchProduct/Presentation/UI/Product_detail/delete_update_button.dart';
import 'package:ecommers/Features/SearchProduct/Presentation/UI/Product_detail/description.dart';
import 'package:ecommers/Features/SearchProduct/Presentation/UI/Product_detail/size_of_product.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../../../../AddProduct/Presentation/UI/add_delete_button.dart';

class DetailPage extends StatelessWidget {
  const DetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: PreferredSize(
        preferredSize:Size.fromHeight(286), 
        child: Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/image/image.png"),
              fit: BoxFit.fill
            )
          ),
        )),
      body: SingleChildScrollView(
        child: Container(
          color: Colors.white,
          padding: const  EdgeInsets.all(15),
          child:  const Column(
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
                      
                      Text("Men's shoe"),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
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
                          Icon(
                            Icons.star,
                            color: Color.fromARGB(255, 250, 235, 102),
                            size: 20,
                          ),
                          Text(
                            "(4.0)",
                            style: TextStyle(fontSize: 10),
                          ),
        
        
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                        Text("\$120"),
                    ],
                  )
                ],
              ),
               SizedBox(height: 15,),
               // size of product if avilable
              Text("Size:", style: TextStyle(fontSize: 20,fontWeight: FontWeight.w400),),
              SizedBox(height: 10,),
              SizeOfProduct(),
              SizedBox(height: 10,),
               SizedBox(
                
                child:  Description(),
               
               ),
               SizedBox(height: 10,),
               Row(

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