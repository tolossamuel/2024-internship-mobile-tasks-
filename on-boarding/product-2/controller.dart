
import 'dart:io';

import 'data_logic.dart';
import 'product_model.dart';

class Controller {
  DataLogic dataLogic = DataLogic();


  // add product to the list
  void takeInputForAdd(){
    print("Enter the name of Product :");
    String? name = stdin.readLineSync();
    if (name != null){
      print("Enter the description of Product :");
      String? description = stdin.readLineSync();
      if(description != null){
        print("Enter the price of Product :");
        String? priceString = stdin.readLineSync();
        double? price = double.tryParse(priceString ?? '');
        if (price != null){
          Product newProduct = Product(name: name, description: description, price: price);
          dataLogic.addProduct(newProduct);
          print("saved!!!");
        } else {
          print("amount of price at lest 1");
          takeInputForAdd();
        }
      } else {
        print("length of description at lest 1 :");
        takeInputForAdd();
      }
    } else {
      print("length of name at lest 1 :");
      takeInputForAdd();
    }

  }

  // feach all the data from the list
  void allData(){
    List<Product> product_data = dataLogic.feachAllProduct();
    int counter = 1;
    for (Product product in product_data){
      print("Product : ${counter}\n");
      print("\tName : ${product.name}\n\tDescription : ${product.description}\n\tPrice : ${product.price}");
      counter += 1;
    }
  }

  // feach data by the name
  void takeInputForSearch(){
    print("Search by name");
    print("Enter the name of product or enter 0 for back");
    String? name = stdin.readLineSync();
    if (name != null && name != 0){

      Product? product = dataLogic.filterData(name);
      if (product != null){
        print("Name : ${product.name}\nDescription : ${product.description}\nPrice : ${product.price}");
      }
      else {
        print("Their is no data base on the give name");
      }
      

    }

  }

  // edite the data by name

  void edite(){
    print("Enter the name to edite");
    print("Enter the name of product or enter 0 for back");
    String? name = stdin.readLineSync();
 
    if (name != null && name != 0){

      Product? product = dataLogic.filterData(name);
      if (product != null){
        print("Name : ${product.name}\nDescription : ${product.description}\nPrice : ${product.price}");
        print("Enter the new name of Product or just Enter :");
        String? name = stdin.readLineSync();
        print("Enter the new description of Product or just Enter :");
        String? description = stdin.readLineSync();
        print("Enter the price of Product or just Enter:");
        String? priceString = stdin.readLineSync();
        double? price = double.tryParse(priceString ?? '');
        if (name == null){
          name = product.name;
        }
        if (description == null){
          description = product.description;
        }
        if (price == null) {
          price = product.price;
        }
        dataLogic.EditeProduct(name, description, price, product);

      }
      else {
        print("Their is no data base on the give name");
      }
      

    }
  }

// delte the data

  void delete(){
    print("Search by name to delete");
    print("Enter the name of product or enter 0 for back");
    String? name = stdin.readLineSync();
    if (name != null && name != 0){

      Product? product = dataLogic.filterData(name);
      if (product != null){
        dataLogic.Delete(product);
      }
      else {
        print("Their is no data base on the give name");
      }

    }

  }

}