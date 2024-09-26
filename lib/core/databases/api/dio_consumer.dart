import 'package:dio/dio.dart';
import 'package:productstaskapp/core/databases/api/api_consumer.dart';
import 'package:productstaskapp/core/databases/api/end_points.dart';

import '../../errors/expentions.dart';

class DioConsumer extends ApiConsumer {
  final Dio dio;

  DioConsumer({required this.dio}) {
    dio.options.baseUrl = EndPoints.baseUrl;
  }

  //! GET
  @override
  Future get(String path, {Map<String, dynamic>? queryParameters}) async {
    try {
      var res = await dio.get(path, queryParameters: queryParameters);
      return res.data;
    } on DioException catch (e) {
      handleDioException(e);
    }
  }
}
