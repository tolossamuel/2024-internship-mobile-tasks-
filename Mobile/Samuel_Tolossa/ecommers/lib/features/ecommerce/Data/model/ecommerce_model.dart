

import 'dart:core';


import '../../Domain/entity/ecommerce_entity.dart';

class EcommerceModel extends EcommerceEntity {

  const EcommerceModel ({
    required super.id,
    required super.name,
    required super.description,
    required super.imageUrl,
    required super.price,
  });


  factory EcommerceModel.fromJson(dynamic json) => EcommerceModel(
    id: json['id'],
    name: json['title'],
    description: json['description'],
    imageUrl: json['image'],
    price: json['price'].toDouble()
  );
 
  static List<EcommerceModel> getAllProduct(List<dynamic> jsons) {
    List<EcommerceModel> products = [];
    for (dynamic product in jsons){
      products.add(EcommerceModel.fromJson(product));
    }
    return products;
  }
  Map<String,dynamic> toJson() => {
    'id' : id,
    'name' : name,
    'description' : description,
    'imageUrl' : imageUrl,
    'price' : price
  };

  EcommerceEntity toEntity() => EcommerceEntity(
    id:id,
    name: name,
    description: description,
    imageUrl: imageUrl,
    price: price
  );
  static List<EcommerceEntity> listToEntity(List<EcommerceModel> models) {
    return models.map((model) => model.toEntity()).toList();
  }
}
