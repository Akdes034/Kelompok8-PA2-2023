import 'package:dartz/dartz.dart';
import '../../../../core/failure.dart';
import '../../data/models/products/product_model.dart';

abstract class HomeRepository {
  Future<Either<Failure, ProductList>> getProductsFromServer(String search);
}
