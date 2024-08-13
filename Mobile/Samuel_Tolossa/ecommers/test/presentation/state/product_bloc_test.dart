


import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:ecommers/core/Error/failure.dart';
import 'package:ecommers/features/ecommerce/Domain/entity/ecommerce_entity.dart';
import 'package:ecommers/features/ecommerce/presentation/state/product_bloc/product_bloc.dart';
import 'package:ecommers/features/ecommerce/presentation/state/product_bloc/product_event.dart';
import 'package:ecommers/features/ecommerce/presentation/state/product_bloc/product_state.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import '../../helper/test_hlper.mocks.dart';

void main() {
  late MockEcommerceUsecase mockEcommerceUsecase;
  late ProductBloc productBloc;

  setUp(() {
    mockEcommerceUsecase = MockEcommerceUsecase();
    productBloc = ProductBloc(ecommerceUsecase: mockEcommerceUsecase);
  });


  test(
    'test the inisial state of the app',
    () {
      expect(productBloc.state, IntialState());
    }
    );
  Map data = {'id': '1', 'name': 'pc', 'description': 'hp', 'imageUrl': 'http', 'price': 2222.2};

  final EcommerceEntity ecommerceEntity = const EcommerceEntity(
    id: '1', 
    name: 'pc', 
    description: 'description', 
    imageUrl: 'imageUrl', 
    price: 123.2);
  final List<EcommerceEntity> listProduct = const [
    EcommerceEntity(
    id: '1', 
    name: 'pc', 
    description: 'description', 
    imageUrl: 'imageUrl', 
    price: 123.2),
    EcommerceEntity(
    id: '1', 
    name: 'pc', 
    description: 'description', 
    imageUrl: 'imageUrl', 
    price: 123.2)
  ];
  group(
    'test the state of the app',
    () {
      blocTest<ProductBloc, ProductState>(
        'emits [MyState] when get product by id success fully.',
        build: (){
          when(
            mockEcommerceUsecase.dataById(any)
          ).thenAnswer((_) async=> Right(ecommerceEntity));
          return productBloc;
        },
        act: (bloc) => bloc.add(const GetSingleProductEvent(id: '1')),
          expect: () => [
            LoadingState(),
            LoadedSingleProductState(product: ecommerceEntity)
          ],
      );

      blocTest<ProductBloc, ProductState>(
        'emits [MyState] when get product by id return failure.',
        build: (){
          when(
            mockEcommerceUsecase.dataById(any)
          ).thenAnswer((_) async => const Left(ConnectionFailur(message: 'try again')));
          return productBloc;
        },
        act: (bloc) => bloc.add(const GetSingleProductEvent(id: '1')),
          expect: () => [
            LoadingState(),
            ErrorState(messages: 'try again'),
            
          ],
      );


      blocTest<ProductBloc, ProductState>(
        'emits [MyState] when get all product return  success fully.',
        build: (){
          when(
            mockEcommerceUsecase.dataForAll()
          ).thenAnswer((_) async => Right(listProduct));
          return productBloc;
        },
        act: (bloc) => bloc.add(const LoadAllProductEvent()),
          expect: () => [
            LoadingState(),
            LoadedAllProductState(products: listProduct),
            
          ],
      );

      blocTest<ProductBloc, ProductState>(
        'emits [MyState] when get  all product must return failure.',
        build: (){
          when(
            mockEcommerceUsecase.dataForAll()
          ).thenAnswer((_) async => const Left(ConnectionFailur(message: 'try again')));
          return productBloc;
        },
        act: (bloc) => bloc.add(const LoadAllProductEvent()),
          expect: () => [
            LoadingState(),
            ErrorState(messages: 'try again'),
            
          ],
      );

      blocTest<ProductBloc, ProductState>(
        'emits [MyState] when add new  product return  success fully.',
        build: (){
          when(
            mockEcommerceUsecase.addProducts(any)
          ).thenAnswer((_) async => const Right(true));
          return productBloc;
        },
        act: (bloc) => bloc.add(CreateProductEvent(ecommerceEntity: data.toString())),
          expect: () => [
            LoadingState(),
            SuccessAdd(add:true),
            
          ],
      );

      blocTest<ProductBloc, ProductState>(
        'emits [MyState] when add new product must return failure.',
        build: (){
          when(
            mockEcommerceUsecase.addProducts(any)
          ).thenAnswer((_) async => const Left(ConnectionFailur(message: 'try again')));
          return productBloc;
        },
        act: (bloc) => bloc.add(CreateProductEvent(ecommerceEntity: data.toString())),
          expect: () => [
            LoadingState(),
            ErrorState(messages: 'try again'),
            
          ],
      );


      blocTest<ProductBloc, ProductState>(
        'emits [MyState] when delete  a product must return  success.',
        build: (){
          when(
            mockEcommerceUsecase.deleteProduct(any)
          ).thenAnswer((_) async => const Right(true));
          return productBloc;
        },
        act: (bloc) => bloc.add(const DeleteProductEvent(id: '1')),
          expect: () => [
            LoadingState(),
            SuccessDelete(deleted:true),
            
          ],
      );

      blocTest<ProductBloc, ProductState>(
        'emits [MyState] when delete  a product must return failure.',
        build: (){
          when(
            mockEcommerceUsecase.deleteProduct(any)
          ).thenAnswer((_) async => const Left(ConnectionFailur(message: 'try again')));
          return productBloc;
        },
        act: (bloc) => bloc.add(const DeleteProductEvent(id: '1')),
          expect: () => [
            LoadingState(),
            ErrorState(messages: 'try again'),
            
          ],
      );


      blocTest<ProductBloc, ProductState>(
        'emits [MyState] when edit  a product must return  success.',
        build: (){
          when(
            mockEcommerceUsecase.editProduct(any,any)
          ).thenAnswer((_) async => const Right(true));
          return productBloc;
        },
        act: (bloc) => bloc.add( UpdateProductEvent(id: '1',ecommerceEntity:data.toString())),
          expect: () => [
            LoadingState(),
            SuccessEdit(edited:true),
            
          ],
      );

      blocTest<ProductBloc, ProductState>(
        'emits [MyState] when edit  a product must return failure.',
        build: (){
          when(
            mockEcommerceUsecase.editProduct(any,any)
          ).thenAnswer((_) async => const Left(ConnectionFailur(message: 'try again')));
          return productBloc;
        },
        act: (bloc) => bloc.add(UpdateProductEvent(id: '1',ecommerceEntity: data.toString())),
          expect: () => [
            LoadingState(),
            ErrorState(messages: 'try again'),
            
          ],
      );
    }
    );

  

 
}