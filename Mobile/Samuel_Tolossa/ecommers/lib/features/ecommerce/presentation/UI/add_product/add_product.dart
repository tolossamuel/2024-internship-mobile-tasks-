
import 'package:flutter/material.dart';

import 'add_delete_button.dart';
import 'image_field.dart';
import 'input_border.dart';

class AddProduct extends StatefulWidget {
  const AddProduct({super.key});

  @override
  State<AddProduct> createState() => _AddProductState();
}

class _AddProductState extends State<AddProduct> {
  @override

  Widget build(BuildContext context) {
    final Map<String, dynamic> data = ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
  
    return Scaffold(
      appBar: AppBar(
      
        backgroundColor: Colors.white,
        title: const Text('Add Product'),
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
      body: SingleChildScrollView(
        
        child: Container(
          color: Colors.white,
          padding: const EdgeInsets.fromLTRB(20,15,20,10),
          child:  Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children:[
              ImageField(
                hight: 190,
                check: true,
                text: 'Photo',
                width: 366,
                imageUrl:data['imageUrl'],
                ),
              const SizedBox(height: 10,),
              const Text('name'),
              const SizedBox(height: 5,),
              IinputBorder(hight: 65,check: false,text: 'name',width: 366,placeHolder : data['name']),
              const SizedBox(height: 10,),
              const Text('catagory'),
              const SizedBox(height: 5,),
              IinputBorder(hight: 65,check: false,text: 'catagory',width: 366,placeHolder : data['name']),
              const SizedBox(height: 10,),
              const Text('price'),
              const SizedBox(height: 5,),
              IinputBorder(hight: 56,check: false,text: 'price',width: 366,placeHolder : data['price'].toString()),
              const SizedBox(height: 10,),
              const Text('description'),
              const SizedBox(height: 5,),
              IinputBorder(hight: 140,check: false,text: 'description',width: 366,placeHolder : data['disc']),
              const SizedBox(height: 15,),
              AddDeleteButton(color: Colors.blue,text:data['name'] != ''?'EDIT': 'ADD',borderColor: Colors.blue,),
              const SizedBox(height: 10,),
              const AddDeleteButton(color: Colors.white, text: 'DELETE',borderColor: Colors.red,),
              
            
            ], 
          ),
        ),
      ),
    );
  }
}