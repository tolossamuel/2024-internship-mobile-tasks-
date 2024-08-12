
import 'package:equatable/equatable.dart';

import '../../../Domain/entity/ecommerce_entity.dart';

abstract class ProductEvent  extends Equatable{
  const ProductEvent ();

  @override
  List<Object ?> get props => [];
}

class LoadAllProductEvent extends ProductEvent {
  const LoadAllProductEvent ();

  @override
  List<Object ?> get props => [];
}

class GetSingleProductEvent extends ProductEvent {
  final int id;
  const GetSingleProductEvent({
    required this.id
  });
  @override
  List<Object ?> get props => [id];
}


class DeleteProductEvent extends ProductEvent {
  final int id;
  const DeleteProductEvent({
    required this.id
  });
  @override
  List<Object ?> get props => [id];
}


class CreateProductEvent extends ProductEvent {
  final EcommerceEntity ecommerceEntity;
  const CreateProductEvent({
    required this.ecommerceEntity
  });
  @override
  List<Object ?> get props => [ecommerceEntity];
}


class UpdateProductEvent extends ProductEvent {
  final EcommerceEntity ecommerceEntity;
  final int id;
  const UpdateProductEvent({
    required this.ecommerceEntity,
    required this.id
  });
  @override
  List<Object ?> get props => [ecommerceEntity,id];
}


