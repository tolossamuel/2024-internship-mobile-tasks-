

import 'dart:core';

import 'package:dartz/dartz.dart';
import 'package:ecommers/Domain/entity/ecommerce_entity.dart';
import 'package:ecommers/Domain/repositories/ecommerce_repositories.dart';
import 'package:ecommers/core/Error/failure.dart';
import 'package:equatable/equatable.dart';

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
    Future<Either<Failure,EcommerceEntity>> editProduct(int id){
      return repositories.editeProduct(id);
    }

    // delte product 
    Future<Either<Failure,EcommerceEntity>> deleteProduct(int id){
      return repositories.deleteProduct(id);
    }

    // add new product 
    Future<Either<Failure,EcommerceEntity>> addProducts(EcommerceEntity entity ){
      return repositories.addProduct(entity);
    }

    @override
 
    List<Object?> get props => throw UnimplementedError();
  

}