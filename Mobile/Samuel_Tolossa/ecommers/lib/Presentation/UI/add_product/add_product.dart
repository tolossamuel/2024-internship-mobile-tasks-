
import 'package:ecommers/Presentation/UI/add_product/input_border.dart';
import 'package:ecommers/Presentation/UI/add_product/add_delete_button.dart';
import 'package:flutter/material.dart';

class AddProduct extends StatefulWidget {
  const AddProduct({super.key});

  @override
  State<AddProduct> createState() => _AddProductState();
}

class _AddProductState extends State<AddProduct> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text("Add Product"),
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
          child: const Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children:[
              IinputBorder(hight: 190,check: true,text: "Photo"),
              SizedBox(height: 10,),
              Text("name"),
              SizedBox(height: 5,),
              IinputBorder(hight: 56,check: false,text: "name"),
              SizedBox(height: 10,),
              Text("catagory"),
              SizedBox(height: 5,),
              IinputBorder(hight: 56,check: false,text: "catagory"),
              SizedBox(height: 10,),
              Text("price"),
              SizedBox(height: 5,),
              IinputBorder(hight: 56,check: false,text: "price"),
              SizedBox(height: 10,),
              Text("description"),
              SizedBox(height: 5,),
              IinputBorder(hight: 140,check: false,text: "description"),
              SizedBox(height: 15,),
              AddDeleteButton(color: Colors.blue,text: "ADD",borderColor: Colors.blue,),
              SizedBox(height: 10,),
              AddDeleteButton(color: Colors.white, text: "DELETE",borderColor: Colors.red,),
              
            
            ], 
          ),
        ),
      ),
    );
  }
}