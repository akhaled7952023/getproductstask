import 'package:dio/dio.dart';
import 'package:productstaskapp/Features/Products/data/models/product_model.dart';
import 'package:productstaskapp/core/databases/api/api_consumer.dart';
import 'package:productstaskapp/core/databases/api/end_points.dart';
import 'package:productstaskapp/core/errors/error_model.dart';
import 'package:productstaskapp/core/errors/expentions.dart';

abstract class ProductRemoteDataSource {
  Future<List<ProductModel>> getAllProducts();
}

class ProductRemoteDataSourceImpl implements ProductRemoteDataSource {
  final Dio dio;

  ProductRemoteDataSourceImpl({required this.dio});

  @override
  Future<List<ProductModel>> getAllProducts() async {
    try {
      final response = await dio.get("${EndPoints.baseUrl}${EndPoints.products}");

      return List<ProductModel>.from(
        (response.data as List).map((item) => ProductModel.fromJson(item)),
      );
    } catch (error) {
      throw ServerException(ErrorModel(status: 500, errorMessage: error.toString()));
    }
  }
}
