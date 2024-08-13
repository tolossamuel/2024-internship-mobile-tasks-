

import 'dart:convert';
import 'dart:core';

import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

import '../../../../core/Error/failure.dart';
import '../../Data/model/ecommerce_model.dart';
import '../entity/ecommerce_entity.dart';
import '../repositories/ecommerce_repositories.dart';

class EcommerceUsecase extends Equatable {

    final EcommerceRepositories repositories;
    const EcommerceUsecase ({
      required this.repositories
    });

    // feach all data
    Future<Either<Failure,List<EcommerceEntity>>> dataForAll() {
      return  repositories.getAllProduct();
    }

    // get data by id
    Future<Either<Failure,EcommerceEntity>> dataById(String id) {
      return repositories.getProductById(id);
    }

    // edit the product
    Future<Either<Failure,bool>> editProduct(String id, String jsonString){
    
      final datas = json.decode(jsonString);
    
      final EcommerceModel ecommerceModel = EcommerceModel.fromJson(datas['data']);
      return repositories.editeProduct(id,ecommerceModel);
    }

    // delte product 
    Future<Either<Failure,bool>> deleteProduct(String id){
      return repositories.deleteProduct(id);
    }

    // add new product 
    Future<Either<Failure,bool>> addProducts(String jsonString ){
      final data = json.decode(jsonString);
      final EcommerceModel ecommerceModel = EcommerceModel.fromJson(data['data']);
      return repositories.addProduct(ecommerceModel);
    }

    @override
 
    List<Object?> get props => throw UnimplementedError();
  

}