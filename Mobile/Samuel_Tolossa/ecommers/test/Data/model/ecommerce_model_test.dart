

import 'dart:convert';

import 'package:ecommers/features/ecommerce/Data/model/ecommerce_model.dart';
import 'package:ecommers/features/ecommerce/Domain/entity/ecommerce_entity.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../helper/dummy_data/read_json.dart';


void main() {
  const EcommerceModel model = EcommerceModel(
    id: 1,
    name: 'Fjallraven - Foldsack No. 1 Backpack, Fits 15 Laptops',
    description: 'Your perfect pack for everyday use and walks in the forest. Stash your laptop (up to 15 inches) in the padded sleeve, your everyday',
    imageUrl: 'https://fakestoreapi.com/img/81fPKd-2AYL._AC_SL1500_.jpg',
    price: 109.95
  );

  test(
    'the model must similar to the entity of domain',
    () async{
      

        expect(model,isA<EcommerceEntity>());
    
    });
  test(
    'the model from json test must similar to the midel',
    () async{

      final dynamic jsonData = json.decode(
        readJson('helper/dummy_data/json_respond_data.json')
      );
      final result = EcommerceModel.fromJson(jsonData);
      expect(result, equals(model));
    
    });
  
  test(
    'convert object to json format',
     () async {
      final result = model.toJson();
      final Map<String,dynamic> expectedJson = {
        'id': 1,
        'name': 'Fjallraven - Foldsack No. 1 Backpack, Fits 15 Laptops',
        'description': 'Your perfect pack for everyday use and walks in the forest. Stash your laptop (up to 15 inches) in the padded sleeve, your everyday',
        'imageUrl': 'https://fakestoreapi.com/img/81fPKd-2AYL._AC_SL1500_.jpg',
        'price': 109.95
      };
      expect(expectedJson, equals(result));
     }
     );
}