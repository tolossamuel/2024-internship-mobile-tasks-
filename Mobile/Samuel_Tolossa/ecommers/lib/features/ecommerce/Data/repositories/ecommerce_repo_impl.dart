import 'package:dartz/dartz.dart';

import '../../../../core/Error/error.dart';
import '../../../../core/Error/failure.dart';
import '../../Domain/entity/ecommerce_entity.dart';
import '../../Domain/repositories/ecommerce_repositories.dart';
import '../data_source/remote_data_source.dart';
import '../model/ecommerce_model.dart';

class EcommerceRepoImpl implements EcommerceRepositories {
  final EcommerceRemoteDataSource remoteDataSource;
  const EcommerceRepoImpl({
    required this.remoteDataSource,
  });

  @override
  Future<Either<Failure, bool>> addProduct(EcommerceEntity product) {
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, bool>> deleteProduct(int id) {
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, bool>> editeProduct(int id) {
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, List<EcommerceEntity>>> getAllProduct() async {
    try {
      final result = await remoteDataSource.getAllProduct();
      final entities = EcommerceModel.listToEntity(result);
      return Right(entities);
    } on ServerFailure {
      throw const ServerFailure(message: 'server Error');
    } on ConnectionFailur {
      throw const ConnectionFailur(message: 'Connection Error');
    }
  }

  @override
  Future<Either<Failure, EcommerceEntity>> getProductById(int id) async {
    try {
      final result = await remoteDataSource.getProduct(id);
      final entities = result.toEntity();
      return Right(entities);
    } on ServerFailure {
      throw const ServerFailure(message: 'server Error');
    } on ConnectionFailur {
      throw const ConnectionFailur(message: 'Connection Error');
    }
  }
}
