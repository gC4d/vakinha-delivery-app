// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:delivery_app/src/dto/order_product_dto.dart';
import 'package:delivery_app/src/models/product_model.dart';

import 'package:delivery_app/src/pages/home/home_state.dart';
import 'package:delivery_app/src/repositories/products/products_repository.dart';

class HomeController extends Cubit<HomeState> {
  final ProductsRepository _productsRepository;

  HomeController(
    this._productsRepository,
  ) : super(const HomeState.initial());

  Future<void> loadProducts() async {
    emit(state.copyWith(status: HomeStateStatus.loading));
    try {
      final prodducts = await _productsRepository.findAllProducts();
      emit(
        state.copyWith(
          status: HomeStateStatus.loaded,
          products: prodducts,
        ),
      );
    } catch (e, s) {
      log('Erro ao buscar produto', error: e, stackTrace: s);
      emit(state.copyWith(
          status: HomeStateStatus.error,
          errorMessage: 'Erro ao buscar produtos'));
    }
  }

  void addOrUpdateBag(OrderProductDto orderProduct) {
    final shoppingBag = [...state.shoppingBag];
    final orderIndex = shoppingBag
        .indexWhere((orderP) => orderP.product == orderProduct.product);

    if (orderIndex > -1) {
      shoppingBag[orderIndex] = orderProduct;
    } else {
      shoppingBag.add(orderProduct);
    }

    emit(state.copyWith(shoppingBag: shoppingBag));
  }
}
