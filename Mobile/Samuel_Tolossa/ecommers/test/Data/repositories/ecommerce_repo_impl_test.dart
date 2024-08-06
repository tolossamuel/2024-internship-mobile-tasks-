

import 'package:dartz/dartz.dart';
import 'package:ecommers/core/Error/error.dart';
import 'package:ecommers/features/ecommerce/Data/model/ecommerce_model.dart';
import 'package:ecommers/features/ecommerce/Data/repositories/ecommerce_repo_impl.dart';
import 'package:ecommers/features/ecommerce/Domain/entity/ecommerce_entity.dart';


import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import '../../helper/test_hlper.mocks.dart';

void main() {
  late EcommerceRepoImpl  ecommerceRepoImpl;
  late MockEcommerceRemoteDataSourceImpl mockData;


  setUp(() {
    mockData = MockEcommerceRemoteDataSourceImpl();
    ecommerceRepoImpl = EcommerceRepoImpl(remoteDataSource: mockData);
  });


  EcommerceEntity ecommerceEntity = const EcommerceEntity(
    id: 1,
    name: 'hp pc',
    description: 'brand new hp pc',
    imageUrl: 'http/hp.png',
    price: 234.4
  );

  // const List<EcommerceEntity> listEcommerceEntity = [
  //    EcommerceEntity(
  //   id: 1,
  //   name: 'hp pc',
  //   description: 'brand new hp pc',
  //   imageUrl: 'http/hp.png',
  //   price: 234.4
  // ),
  //  EcommerceEntity(
  //   id: 1,
  //   name: 'hp pc',
  //   description: 'brand new hp pc',
  //   imageUrl: 'http/hp.png',
  //   price: 234.4
  // )
  // ];

  int id = 1;
  const EcommerceModel ecommerceModel =  EcommerceModel(
    id: 1,
    name: 'hp pc',
    description: 'brand new hp pc',
    imageUrl: 'http/hp.png',
    price: 234.4
  );
  const List<EcommerceModel> listEcommerceModel = [
     EcommerceModel(
    id: 1,
    name: 'hp pc',
    description: 'brand new hp pc',
    imageUrl: 'http/hp.png',
    price: 234.4
  ),
  EcommerceModel(
    id: 1,
    name: 'hp pc',
    description: 'brand new hp pc',
    imageUrl: 'http/hp.png',
    price: 234.4
  )
  ];


  group(
    'test the data sour', () {


      test(
        'test the respond of the repo impl success', 
        () async {
          when(
            mockData.getProduct(id)
          ).thenAnswer((_) async => ecommerceModel);

          final result = await ecommerceRepoImpl.getProductById(id);
          expect(result, equals(Right(ecommerceEntity)));
        });


        test(
        'test get unsecceful respond from the repo impl', 
        () async {
          when(
            mockData.getProduct(id)
          ).thenThrow(const ServerFailure(message: 'server error'));

          final result =  ecommerceRepoImpl.getProductById(id);
          expect(result, throwsA(isA<ServerFailure>()));
        });

        test(
        'test get unsecceful from get all product from the repo impl', 
        () async {
          when(
            mockData.getAllProduct()
          ).thenThrow(const ServerFailure(message: 'server error'));

          final result =  ecommerceRepoImpl.getAllProduct();
          expect(result, throwsA(isA<ServerFailure>()));
        });

        test(
        'test get unsecceful connection error from get all product from the repo impl', 
        () async {
          when(
            mockData.getAllProduct()
          ).thenThrow(const ConnectionFailur(message: 'connection error'));

          final result =  ecommerceRepoImpl.getAllProduct();
          expect(result, throwsA(isA<ConnectionFailur>()));
        });

        test(
        'test get unsecceful connection error from get all product from the repo impl', 
        () async {
          when(
            mockData.getProduct(id)
          ).thenThrow(const ConnectionFailur(message: 'connection error'));

          final result =  ecommerceRepoImpl.getProductById(id);
          expect(result, throwsA(isA<ConnectionFailur>()));
        });

        test(
          'test getall product secceful from the repo impl', 
          () async {
            when(
              mockData.getAllProduct()
            ).thenAnswer((_) async => listEcommerceModel);

            // final result = await ecommerceRepoImpl.getAllProduct();
            var results = (await ecommerceRepoImpl.getAllProduct()).fold(
                        (failure) => failure,
                        (response) => response,

                    );
            
            expect(results, isA<List<EcommerceEntity>>());
            // expect(result, orderedEquals( const Right(listEcommerceEntity).value));
            // expect(result.value, unorderedEquals(listEcommerceEntity.value))
          }
        );  
        
    });



}