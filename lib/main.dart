import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:productstaskapp/Features/Products/data/reposotries/product_reposotry_impl.dart';
import 'package:productstaskapp/Features/Products/presentation/screens/products.dart';
import 'package:productstaskapp/Features/Products/presentation/cubit/product_cubit.dart';
import 'package:productstaskapp/Features/Products/data/datasource/product_datasource.dart';
import 'package:productstaskapp/core/connection/network_info.dart';
import 'package:dio/dio.dart';
import 'package:connectivity_plus/connectivity_plus.dart';

void main() {
  // تهيئة الـ Dio و NetworkInfo و Repository هنا فقط
  final dio = Dio();
  final productDataSource = ProductRemoteDataSourceImpl(dio: dio);
  final networkInfo = NetworkInfoImpl(Connectivity());
  final productRepository = ProductRepositoryImpl(
    remoteDataSource: productDataSource,
    networkInfo: networkInfo,
  );

  runApp(MyApp(productRepository: productRepository));
}

class MyApp extends StatelessWidget {
  final ProductRepositoryImpl productRepository;

  const MyApp({super.key, required this.productRepository});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: BlocProvider(
        create: (context) => ProductCubit(productRepository)..fetchProducts(),
        child: Products(),
      ),
    );
  }
}
