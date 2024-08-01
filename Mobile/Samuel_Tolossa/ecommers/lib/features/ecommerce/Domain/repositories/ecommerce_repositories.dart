
import 'package:dartz/dartz.dart';
import '../../../../core/Error/failure.dart';
import '../entity/ecommerce_entity.dart';

abstract class EcommerceRepositories {


  Future<Either<Failure,EcommerceEntity>> getProductById(int id);

  Future<Either<Failure,List<EcommerceEntity>>> getAllProduct();

  Future<Either<Failure,EcommerceEntity>> addProduct(EcommerceEntity product);

  Future<Either<Failure,EcommerceEntity>> editeProduct(int id);
  
  Future<Either<Failure,EcommerceEntity>> deleteProduct(int id);

}