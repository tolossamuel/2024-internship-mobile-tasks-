
// model data set for the products
class Product {
  String name;
  String description;
  double price;
  Product({required this.name, required this.description, required this.price});

  // convert product data to map format key and value
  Map<String,dynamic> toMap() {
    return {
      'name':name,
      'description' : description,
      'price': price,
    };
  }

  // create object from the map key value

  factory Product.fromMap(Map<String,dynamic> map) {
    return Product(
      name:map['name'],
      description: map['description'],
      price: map['price'],
    );
  }

  // convert task object in to json format

  Map<String,dynamic> toJson(){
    return {
      'name':name,
      'descrition':description,
      'price':price
    };
  }

}