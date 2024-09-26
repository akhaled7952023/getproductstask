import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:productstaskapp/Features/Products/domain/repositry/product_repository.dart';
import 'product_state.dart';

class ProductCubit extends Cubit<ProductState> {
  final ProductRepository productRepository;

  ProductCubit(this.productRepository) : super(ProductInitial());

  Future<void> fetchProducts() async {
    emit(ProductLoading());
    final result = await productRepository.getAllProducts();

    result.fold(
          (failure) {
        if (failure.errMessage == "No Internet Connection") {
          emit(ProductNoInternet(failure.errMessage));
        } else {
          emit(ProductError(failure.errMessage));
        }
      },
          (products) => emit(ProductLoaded(products)),
    );
  }
}
