import 'package:dartz/dartz.dart';
import '../../../../core/Error/failure.dart';
import '../../../../core/network/check_connectivity.dart';
import '../../Domain/entity/ecommerce_entity.dart';
import '../../Domain/repositories/ecommerce_repositories.dart';
import '../data_source/remote_data_source.dart';
import '../model/ecommerce_model.dart';

class EcommerceRepoImpl implements EcommerceRepositories  {
  final EcommerceRemoteDataSource remoteDataSource;
  final NetworkInfo networkInfo;
  const EcommerceRepoImpl({
    required this.remoteDataSource,
    required this.networkInfo
  });

  @override
  Future<Either<Failure, bool>> addProduct(EcommerceEntity product) async{
    try {
      final connection = await networkInfo.isConnected;
      if(connection == false){
        return const Left(ConnectionFailur(message: 'connection error'));
      }
      final data = product.toModel();
      final result = await remoteDataSource.addProduct(data);
      return Right(result);
    } on ConnectionFailur {
      return const Left(ConnectionFailur(message: 'connection error'));
    }
  }

  @override
  Future<Either<Failure, bool>> deleteProduct(String id) async{
    try {
      final connection = await networkInfo.isConnected;
      if(connection == false){
        return const Left(ConnectionFailur(message: 'connection error'));
      }
      final result = await remoteDataSource.deleteProduct(id);
      return Right(result);
    } on ConnectionFailur {
      return const Left(ConnectionFailur(message: 'connection error'));
    }
  }

  @override
  Future<Either<Failure, bool>> editeProduct(String id,EcommerceModel data) async{
    try {
      final connection = await networkInfo.isConnected;
      if(connection == false){
        return const Left(ConnectionFailur(message: 'connection error'));
      }
      final result = await remoteDataSource.editProduct(id,data);
      return Right(result);
    } on ConnectionFailur {
      return const Left(ConnectionFailur(message: 'connection error'));
    }
  }

  @override
  Future<Either<Failure, List<EcommerceEntity>>> getAllProduct() async {
    try {
      final connection = await networkInfo.isConnected;
      if(connection == false){
        return const Left(ConnectionFailur(message: 'connection error'));
      }
      final result = await remoteDataSource.getAllProducts();
      final entities = EcommerceModel.listToEntity(result);
      return Right(entities);
    } on ServerFailure {
      return const Left(ServerFailure(message: 'server Error'));
    } on ConnectionFailur {
      return const Left(ConnectionFailur(message: 'Connection Error'));
    }
  }

  @override
  Future<Either<Failure, EcommerceEntity>> getProductById(String id) async {
    try {
      final connection = await networkInfo.isConnected;
      if(connection == false){
        return const Left(ConnectionFailur(message: 'connection error'));
      }
      final result = await remoteDataSource.getProduct(id);
      final entities = result.toEntity();
      return Right(entities);
    } on ServerFailure {
      return const Left(ServerFailure(message: 'server Error'));
    } on ConnectionFailur {
      return const Left(ConnectionFailur(message: 'Connection Error'));
    }
  }
  
  
  
}
