

import 'dart:core';

import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

import '../../../../core/Error/failure.dart';
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
    Future<Either<Failure,EcommerceEntity>> dataById(int id) {
      return repositories.getProductById(id);
    }

    // edit the product
    Future<Either<Failure,bool>> editProduct(int id, EcommerceEntity data){
      final result = data.toModel();
      return repositories.editeProduct(id,result);
    }

    // delte product 
    Future<Either<Failure,bool>> deleteProduct(int id){
      return repositories.deleteProduct(id);
    }

    // add new product 
    Future<Either<Failure,bool>> addProducts(EcommerceEntity entity ){
      
      return repositories.addProduct(entity);
    }

    @override
 
    List<Object?> get props => throw UnimplementedError();
  

}