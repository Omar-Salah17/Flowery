import 'dart:developer';

import 'package:flowery/core/apiManger/apiService.dart';
import 'package:flowery/features/productsDetails/data/models/product_details_model/product_details_model.dart';
import 'package:flowery/features/productsDetails/data/remote/product_details_remote_data_source.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: ProductDetailsRemoteDataSource)
class ProductDetailsRemoteDataSourceImpl
    implements ProductDetailsRemoteDataSource {
  final ApiService apiServices;

  ProductDetailsRemoteDataSourceImpl({required this.apiServices});
  @override
  Future<ProductDetailsModel> getProductDetails(String producrId) async {
    var response = await apiServices.getProductDetails(producrId);
    log("data from RemoteDataSourceImpl $response");
    return response;
  }
}
