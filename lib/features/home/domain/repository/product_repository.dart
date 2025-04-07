import 'package:dartz/dartz.dart';
import 'package:flowery/core/utils/error_handler.dart';
import 'package:flowery/features/home/data/models/product_response_model.dart';

abstract class ProductRepositoryContract {
Future<Either<Failure,List<Products>>> getAllProductByOccasion(
    {required String occasionId});

}