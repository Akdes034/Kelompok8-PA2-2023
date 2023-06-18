import 'package:dartz/dartz.dart';

import '../../../../core/failure.dart';
import '../../../../core/service_locator.dart';
import '../../data/models/products/product_model.dart';
import '../repository/home_repository.dart';

class GetProductsGuestFromServer {
  Future<Either<Failure, ProductList>> getProductsFromServer(String search) {
    return serviceLocator<HomeRepository>().getProductsFromServer(search);
  }

}
