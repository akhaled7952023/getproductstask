abstract class ProductState {}

class ProductInitial extends ProductState {}

class ProductLoading extends ProductState {}

class ProductLoaded extends ProductState {
  final List products;

  ProductLoaded(this.products);
}

class ProductError extends ProductState {
  final String errorMessage;

  ProductError(this.errorMessage);
}

class ProductNoInternet extends ProductState {
  final String message;

  ProductNoInternet(this.message);
}
