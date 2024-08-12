

import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../Domain/usecase/ecommerce_usecase.dart';
import 'product_event.dart';
import 'product_state.dart';

class ProductBloc  extends Bloc<ProductEvent,ProductState>{
  final EcommerceUsecase ecommerceUsecase;

  ProductBloc ({
    required this.ecommerceUsecase
  }):super(IntialState()){
    // on<On

    on<GetSingleProductEvent>(
      (event,emit) async{
        emit(LoadingState());
        final result = await ecommerceUsecase.dataById(event.id);

        result.fold(
          (failure){
            
            emit(ErrorState(messages: 'try again'));
          },
          (data) {
            emit(LoadedSingleProductState(product: data));
          }
        );

      }
    );

    on<LoadAllProductEvent>(
      (event,emit) async{
        emit(LoadingState());
        final result = await ecommerceUsecase.dataForAll();

        result.fold(
          (failure){
            
            emit(ErrorState(messages: 'try again'));
          },
          (data) {
            emit(LoadedAllProductState(products: data));
          }
        );

      }
    );
    on<CreateProductEvent>(
      (event,emit) async {
        emit(LoadingState());
        final result = await ecommerceUsecase.addProducts(event.ecommerceEntity);
        result.fold(
          (failure){
            emit(ErrorState(messages: 'try again'));
          }, 
          (data) {
            emit(SuccessAdd(add: data));
          }
        );
      }
    );
    on<DeleteProductEvent>(
      (event,emit) async {
        emit(LoadingState());
        final result = await ecommerceUsecase.deleteProduct(event.id);
        result.fold(
          (failure){
            emit(ErrorState(messages: 'try again'));
          }, 
          (data) {
            emit(SuccessDelete(deleted: data));
          }
          );
      }

      
    );

    on<UpdateProductEvent>(
      (event,emit) async {
        emit(LoadingState());
        final result = await ecommerceUsecase.editProduct(event.id,event.ecommerceEntity);
        result.fold(
          (failure){
            emit(ErrorState(messages: 'try again'));
          }, 
          (data) {
            emit(SuccessEdit(edited: data));
          }
        );
      }
    );
    
  }

}