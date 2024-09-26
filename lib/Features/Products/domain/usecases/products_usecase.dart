import '../entities/product_entity.dart';
import '../repositry/product_repository.dart';

class GetAllProductsUseCase {
  final ProductRepository repository;

  GetAllProductsUseCase(this.repository);

  Future<List<ProductEntity>> call() async {
    return await repository.getAllProducts();
  }
}
