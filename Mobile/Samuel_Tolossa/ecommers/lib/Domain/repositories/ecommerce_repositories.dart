
import 'package:dartz/dartz.dart';
import 'package:ecommers/Domain/entity/ecommerce_entity.dart';
import 'package:ecommers/core/Error/failure.dart';

abstract class EcommerceRepositories {


  Future<Either<Failure,EcommerceEntity>> getProductById(int id);

  Future<Either<Failure,List<EcommerceEntity>>> getAllProduct();

  Future<Either<Failure,EcommerceEntity>> addProduct(EcommerceEntity product);

  Future<Either<Failure,EcommerceEntity>> editeProduct(int id);
  
  Future<Either<Failure,EcommerceEntity>> deleteProduct(int id);

}