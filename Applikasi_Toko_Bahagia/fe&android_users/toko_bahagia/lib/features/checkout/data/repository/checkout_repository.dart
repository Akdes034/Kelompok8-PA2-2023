import 'package:delshop/core/service_locator.dart';
import 'package:delshop/features/checkout/data/datasource/checkout_remote_source.dart';
import 'package:delshop/features/checkout/data/models/cart/cart_model.dart';

import 'package:delshop/core/failure.dart';

import 'package:dartz/dartz.dart';

import '../../domain/repository/checkout_repository.dart';
import '../../data/models/order/order_model.dart';

class CheckoutRepositoryImpl extends CheckoutRepository {
  @override
  Future<Either<Failure, OrderModel>> checkout(String paymentMethod,String description) {
    return serviceLocator<CheckoutRemoteDataSource>().checkout(paymentMethod,description);
  }

  @override
  Future<Either<Failure, CartList>> getCartFromServer() {
    return serviceLocator<CheckoutRemoteDataSource>().getCartFromServer();
  }

  @override
  double getTotalPrice(CartList cartList) {
    double totalPrice = 0;
    for (var item in cartList) {
      totalPrice += (item.product.price - (item.product.price * item.product.discount/100)) * item.quantity;
    }
    return totalPrice;
  }
}
