import 'package:delshop/core/service_locator.dart';
import 'package:delshop/features/home/data/datasource/home_product_remote_source.dart';
import 'package:delshop/features/home/data/datasource/home_user_local_data_source.dart';
import 'package:delshop/features/home/data/models/products/product_model.dart';
import 'package:delshop/features/home/data/models/user/user_model.dart';
import 'package:dartz/dartz.dart';
import 'package:delshop/features/home/domain/repository/home_repository.dart';
import 'package:delshop/core/failure.dart';

class HomeRepositoryImpl extends HomeRepository {
  @override
  Future<Either<Failure, User>> getUserFromLocalStorage() {
    return serviceLocator<HomeLocalUserDataSource>().getUserFromLocalStorage();
  }

  @override
  Future<Either<Failure, ProductList>> getProductsFromServer(String search) {
    return serviceLocator<ProductsRemoteDataSource>().getProductFromServer(search);
  }
}
