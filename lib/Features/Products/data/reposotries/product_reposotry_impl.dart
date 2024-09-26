import 'package:dartz/dartz.dart';
import 'package:productstaskapp/Features/Products/data/datasource/product_datasource.dart';
import 'package:productstaskapp/Features/Products/domain/entities/product_entity.dart';
import 'package:productstaskapp/Features/Products/domain/repositry/product_repository.dart';
import 'package:productstaskapp/core/errors/failure.dart';
import 'package:productstaskapp/core/errors/expentions.dart';
import 'package:productstaskapp/core/connection/network_info.dart';


class ProductRepositoryImpl implements ProductRepository {
  final ProductRemoteDataSource remoteDataSource;
  final NetworkInfo networkInfo;

  ProductRepositoryImpl({required this.remoteDataSource, required this.networkInfo});

  @override
  Future<Either<Failure, List<ProductEntity>>> getAllProducts() async {
    if (await networkInfo.isConnected) {
      try {
        final productModels = await remoteDataSource.getAllProducts();
        final products = productModels.map((model) => ProductEntity(
          id: model.id,
          title: model.title,
          price: model.price,
          description: model.description,
          image: model.image,
          rating: model.rating,
          ratingCount: model.ratingCount,
        )).toList();

        return Right(products);
      } on ServerException catch (e) {
        return Left(Failure(errMessage: e.errorModel.errorMessage));
      }
    } else {
      return Left(Failure(errMessage: "No Internet Connection"));
    }
  }

}
