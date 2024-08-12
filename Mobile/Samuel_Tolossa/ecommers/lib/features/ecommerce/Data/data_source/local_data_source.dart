import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../../core/Error/failure.dart';
import '../model/ecommerce_model.dart';

abstract class LocalDataSource{
  Future<List<EcommerceModel>> getAllFromLocal();
  Future<EcommerceModel> getSingleProduct(int id);

  Future<bool> addCach(EcommerceModel data);
  Future<bool> deleteCach(int id);

}
const String idOfData  = 'local_ecommer_data';

class LocalDataSourceImpl implements LocalDataSource{

  final SharedPreferences sharedPreferences;
  const LocalDataSourceImpl({
    required this.sharedPreferences
  });
  @override
  Future<List<EcommerceModel>> getAllFromLocal() {
    final jsonString = sharedPreferences.getString(idOfData);
    
    if (jsonString != null){
      final result = json.decode(jsonString);
    return Future.value(EcommerceModel.getAllProduct(result));
    }
    else {
      
      throw const CachException(message: 'No data found');
    }
  }

  @override
  Future<EcommerceModel> getSingleProduct(int num) {

    final jsonString = sharedPreferences.getString(idOfData);
    try {
    if (jsonString != null) {
      final result = EcommerceModel.fromJson(json.decode(jsonString));
      return Future.value(result);
    }
    else {
      throw const CachException(message: 'No data found');
    }
    } catch (e) {
      throw const CachException(message: 'No data found');
     
      }
  }
  
  @override
  Future<bool> addCach(EcommerceModel data) {
    try {
      final jsonString = sharedPreferences.getString(idOfData);
      if (jsonString != null) {
        final List<dynamic> existingData = json.decode(jsonString);
        existingData.add(data.toJson());
        final updatedJsonString = json.encode(existingData);
        return sharedPreferences.setString(idOfData, updatedJsonString);
      
      } else {
        return Future.value(false);
      }
    } catch (e) {
      return Future.value(false);
    }
  }
  
  @override
  Future<bool> deleteCach(int id) async{
    try{
      
      List<EcommerceModel> products =  await getAllFromLocal();
      
      List<EcommerceModel> newProducts = [];
      for (EcommerceModel product in products) {
        if (product.id != id) {
          newProducts.add(product);
        }
      }
      return sharedPreferences.setString(idOfData, json.encode(newProducts));
    } catch (e) {
      return Future.value(false);
    }
  }
  
}