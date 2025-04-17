import 'package:flowery/core/apiManger/apiService.dart';
import 'package:flowery/core/di/di.dart';
import 'package:flowery/features/cart/data/data%20sources/add_to_cart_data_source.dart';
import 'package:flowery/features/cart/data/models/add_product_request.dart';
import 'package:flowery/features/cart/data/models/add_product_response.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: AddToCartDataSource)
class AddToCartDataSourceImp extends AddToCartDataSource {
  final apiServices = getIt<ApiService>();
  @override
  Future<AddProductResponse> addTOCart({
    required AddProductRequest addProductRequest,
  }) async {
    var response = await apiServices.addToCart(addProductRequest);
    return response;
  }
}
