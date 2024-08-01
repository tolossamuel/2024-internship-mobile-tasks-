

import '../../Domain/entity/ecommerce_entity.dart';

class EcommerceModel extends EcommerceEntity {

  const EcommerceModel ({
    required super.id,
    required super.name,
    required super.description,
    required super.imageUrl,
    required super.price,
  });


  factory EcommerceModel.fromJson(Map<String,dynamic> json) => EcommerceModel(
    id: json['id'],
    name: json['name'],
    description: json['disc'],
    imageUrl: json['imageUrl'],
    price: json['price']
  );
  Map<String,dynamic> toJson() => {
    'id' : 2,
    'name' : 'HP PC',
    'disc' : 'brand new laptop',
    'imageUrl' : 'http/samuel.com',
    'price' : 23333.3
  };
}
