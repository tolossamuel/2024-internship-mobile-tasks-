
import 'product_model.dart';
// store data temporary until the program run

List<Product> product_data= [];

// create new product read new product logic

class DataLogic {

  //  add new product to the product_data
  void addProduct(Product product){
    product_data.add(product);
   
  }

  // feach all data from product_data
  List<Product>  feachAllProduct() {
    return product_data;
  }
//  filter data by name
 Product? filterData(String name) {
  for (Product product in product_data) {
    if (product.name == name){
      return product;
    }
  }
  return null;
 }

//  filter the data by price limite
 List<Product> filterByPrice(double price){
  List<Product> maxPrice = [];
  for (Product product in product_data){
    if (product.price <= price){
      maxPrice.add(product);
    }
  }
  return maxPrice;
 }

 void EditeProduct(String name,String description, double price, Product product){
  product.name = name;
  product.price  = price;
  product.description = description;
  print("Edited!!!");
  
 }

 void Delete(Product product){
  product_data.remove(product);
  print("delated!!!");
 }

 


}