import 'dart:convert';
import 'package:http/http.dart' as http;
import '../../../../core/Error/failure.dart';
import '../../../../core/const/const.dart';
import '../model/ecommerce_model.dart';

/// Abstract class representing the remote data source for the Ecommerce feature.
abstract class EcommerceRemoteDataSource {
  
  /// Retrieves a single product by its [id].
  Future<EcommerceModel> getProduct(int id);

  /// Retrieves all products.
  Future<List<EcommerceModel>> getAllProduct();

  /// Edits a product identified by its [id] with the provided [model].
  Future<bool> editProduct(int id, EcommerceModel model);

  /// Deletes a product identified by its [id].
  Future<bool> deleteProduct(int id);

  /// Adds a new product with the provided [data].
  Future<bool> addProduct(EcommerceModel data);
}

/// Implementation of the [EcommerceRemoteDataSource] interface.
class EcommerceRemoteDataSourceImpl implements EcommerceRemoteDataSource {
  final http.Client client;

  EcommerceRemoteDataSourceImpl({
    required this.client,
  });
  
  @override
  Future<EcommerceModel> getProduct(int id) async {
    final response = await client.get(Uri.parse(Urls.getByUrl(id)));
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
  Future<List<EcommerceModel>> getAllProduct() async {
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
  Future<bool> deleteProduct(int id) async {
    final response = await client.delete(Uri.parse(Urls.deleteProduct(id)));
    if (response.statusCode == 200) {
      return Future.value(true);
    } else {
      return Future.value(false);
    }
  }
  
  @override
  Future<bool> editProduct(int id, EcommerceModel model) async {
    // update by put method also it take updated value
    final response = await client.put(
      Uri.parse(Urls.updateProduct(id)),
      body: model.toJson(),
    );
    if (response.statusCode == 200) {
      return Future.value(true);
    } else {
      return Future.value(false);
    }
  }
  
  @override
  Future<bool> addProduct(EcommerceModel data) async {
    final response = await client.post(
      Uri.parse(Urls.addNewProduct()),
      body: data.toJson(),
    );
    if (response.statusCode == 200) {
      return Future.value(true);
    } else {
      return Future.value(false);
    }
  }  
}