
import 'package:dartz/dartz.dart';
import '../../../../core/Error/failure.dart';
import '../../Data/model/ecommerce_model.dart';
import '../entity/ecommerce_entity.dart';

abstract class EcommerceRepositories{


  Future<Either<Failure,EcommerceEntity>> getProductById(String id);

  Future<Either<Failure,List<EcommerceEntity>>> getAllProduct();

  Future<Either<Failure,bool>> addProduct(EcommerceEntity product);

  Future<Either<Failure,bool>> editeProduct(String id,EcommerceModel data);
  
  Future<Either<Failure,bool>> deleteProduct(String id);

}