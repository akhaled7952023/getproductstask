import 'package:flutter/material.dart';
import 'package:productstaskapp/Features/Products/presentation/widgets/product_details_section.dart';
import 'package:productstaskapp/Features/Products/presentation/widgets/product_image_section.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:productstaskapp/Features/Products/presentation/cubit/product_cubit.dart';
import 'package:productstaskapp/Features/Products/presentation/cubit/product_state.dart';

class GridViewScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    final childAspectRatio = screenWidth / (screenHeight * 0.8);

    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.04, vertical: screenHeight * 0.02),
        child: BlocBuilder<ProductCubit, ProductState>(
          builder: (context, state) {
            if (state is ProductLoading) {
              return Center(child: CircularProgressIndicator());
            } else if (state is ProductNoInternet) {
              return Center(child: Text('No Internet Connection'));
            } else if (state is ProductError) {
              return Center(child: Text(state.errorMessage));
            } else if (state is ProductLoaded) {
              return GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: screenWidth * 0.04,
                  mainAxisSpacing: screenHeight * 0.02,
                  childAspectRatio: childAspectRatio,
                ),
                itemCount: state.products.length,
                itemBuilder: (context, index) {
                  return Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(
                        color: Colors.blue,
                        width: 2.0,
                      ),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: ProductImageSection(
                            imageUrl: state.products[index].image,
                            screenHeight: screenHeight,
                            screenWidth: screenWidth,
                          ),
                        ),
                        ProductDetailsSection(

                          product: state.products[index],
                          screenHeight: screenHeight,
                          screenWidth: screenWidth,
                        ),
                      ],
                    ),
                  );
                },
              );
            } else {
              return Center(child: Text('Unexpected error'));
            }
          },
        ),
      ),
    );
  }
}
