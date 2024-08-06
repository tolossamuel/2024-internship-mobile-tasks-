

import 'dart:convert';

import 'package:http/http.dart' as http;

import '../../../../core/Error/error.dart';
import '../../../../core/const/const.dart';
import '../model/ecommerce_model.dart';

abstract class EcommerceRemoteDataSource {
  
  Future<EcommerceModel> getProduct(int id);
  Future<List<EcommerceModel>> getAllProduct();
  Future<bool> editProduct(int id);
  Future<bool> deleteProduct(int id);
  Future<bool> addProduct(EcommerceModel data);
}

class EcommerceRemoteDataSourceImpl implements EcommerceRemoteDataSource {
  final http.Client client;
  EcommerceRemoteDataSourceImpl({
    required this.client
  });
  
  @override
  Future<EcommerceModel> getProduct(int id) async {
    final response = await client.get(Uri.parse(Urls.getByUrl()));
    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      if (data != null) {
        return EcommerceModel.fromJson(data);
      } else {
        throw Exception('Error no data source');
      }
    } else {
     
      throw const ConnectionFailur(message: 'server error');
    }
  }

  @override
  Future <List<EcommerceModel>> getAllProduct() async {
    final response = await client.get(Uri.parse(Urls.getAll()));
    if (response.statusCode == 200) {
      
      final data = json.decode(response.body);
      if (data != null) {
        return EcommerceModel.getAllProduct(data);
      } else {
        throw const ServerFailure(message: 'server Error');
      }
    } else {
      throw const ConnectionFailur(message: 'server Error');
    }
  }
  
  @override
  Future<bool> deleteProduct(int id) {
    // TODO: implement deleteProduct
    throw UnimplementedError();
  }
  
  @override
  Future<bool> editProduct(int id) {
    // TODO: implement editProduct
    throw UnimplementedError();
  }
  
  @override
  Future<bool> addProduct(EcommerceModel data) {
    // TODO: implement addProduct
    throw UnimplementedError();
  }


  

  
}