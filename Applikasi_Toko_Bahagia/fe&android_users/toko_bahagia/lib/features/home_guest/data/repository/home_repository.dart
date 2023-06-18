import 'package:delshop/core/service_locator.dart';
import 'package:delshop/features/home_guest/data/datasource/home_product_remote_source.dart';
import 'package:delshop/features/home_guest/data/models/products/product_model.dart';
import 'package:dartz/dartz.dart';
import 'package:delshop/features/home_guest/domain/repository/home_repository.dart';
import 'package:delshop/core/failure.dart';

class HomeRepositoryImpl extends HomeRepository {
  @override

  @override
  Future<Either<Failure, ProductList>> getProductsFromServer(String search) {
    return serviceLocator<ProductsRemoteDataSource>().getProductFromServer(search);
  }
}
