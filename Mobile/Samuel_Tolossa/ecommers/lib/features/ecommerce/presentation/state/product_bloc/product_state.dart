


import 'package:equatable/equatable.dart';

import '../../../Domain/entity/ecommerce_entity.dart';

abstract class ProductState extends Equatable{
  ProductState();

  @override
  List<Object ?> get props => [];
}

class IntialState extends ProductState {}

class LoadedSingleProductState extends ProductState {
  final EcommerceEntity product;

  LoadedSingleProductState ({
    required this.product
  });

  @override
  List<Object ?> get props => [product];
}

class LoadedAllProductState extends ProductState {
  final List<EcommerceEntity> products;

  LoadedAllProductState ({
    required this.products
  });

  @override

  List<Object ?> get props => [products]; 
}

class SuccessDelete extends ProductState {
  final bool deleted;

  SuccessDelete ({
    required this.deleted
  });

  @override

  List<Object?> get props => [deleted];
}


class SuccessAdd extends ProductState {
  final bool add;

  SuccessAdd ({
    required this.add
  });

  @override

  List<Object?> get props => [add];
}

class SuccessEdit extends ProductState {
  final bool edited;

  SuccessEdit ({
    required this.edited
  });

  @override

  List<Object?> get props => [edited];
}


class ErrorState extends ProductState {
  final String messages;

  ErrorState ({
    required this.messages
  });

  @override
  List<Object ?> get props => [messages];
}


class LoadingState extends ProductState {}
