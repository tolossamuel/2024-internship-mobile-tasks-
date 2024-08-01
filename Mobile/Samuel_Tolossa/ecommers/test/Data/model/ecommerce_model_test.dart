

import 'dart:convert';

import 'package:ecommers/features/ecommerce/Data/model/ecommerce_model.dart';
import 'package:ecommers/features/ecommerce/Domain/entity/ecommerce_entity.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../helper/dummy_data/read_json.dart';


void main() {
  const EcommerceModel model = EcommerceModel(
    id: 1,
    name: 'HP pc',
    description: 'brand nw laptop',
    imageUrl: 'http//samuel.com',
    price: 2333.3
  );

  test(
    'the model must similar to the entity of domain',
    () async{
      

        expect(model,isA<EcommerceEntity>());
    
    });
  test(
    'the model from json test must similar to the midel',
    () async{

      final Map<String,dynamic> jsonData = json.decode(
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
        'id': 2,
        'name': 'HP PC',
        'disc' : 'brand new laptop',
        'imageUrl' : 'http/samuel.com',
        'price' : 23333.3
      };
      expect(expectedJson, equals(result));
     }
     );
}