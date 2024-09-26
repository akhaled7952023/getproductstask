import 'package:flutter/material.dart';
import 'package:productstaskapp/Features/Products/domain/entities/product_entity.dart';  // تأكد من استيراد الـ ProductEntity

class ProductDetailsSection extends StatelessWidget {
  final ProductEntity product;
  final double screenHeight;
  final double screenWidth;

  ProductDetailsSection({
    required this.product,
    required this.screenHeight,
    required this.screenWidth,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.02, vertical: screenHeight * 0.01),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            product.title,
            style: TextStyle(
              fontSize: screenHeight * 0.018,
              fontWeight: FontWeight.bold,
            ),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
          Text(
            product.description,
            style: TextStyle(
              fontSize: screenHeight * 0.014,
              color: Colors.grey,
            ),
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
          SizedBox(height: screenHeight * 0.01),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Text(
                    "EGP ${product.price}",
                    style: TextStyle(
                      fontSize: screenHeight * 0.018,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  SizedBox(width: screenWidth * 0.02),
                  Text(
                    "2,000 EGP",
                    style: TextStyle(
                      fontSize: screenHeight * 0.014,
                      color: Colors.blue,
                      decoration: TextDecoration.lineThrough,
                    ),
                  ),
                ],
              ),
            ],
          ),
          Padding(
            padding: EdgeInsets.only(right: screenWidth * 0.01, bottom: screenHeight * 0.01),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Text(
                      "Review (${product.rating})",  // استخدام التقييم
                      style: TextStyle(
                        fontSize: screenHeight * 0.014,
                        color: Colors.grey,
                      ),
                    ),
                    SizedBox(width: screenWidth * 0.01),
                    Icon(
                      Icons.star,
                      color: Colors.amber,
                      size: screenHeight * 0.02,
                    ),
                  ],
                ),
                CircleAvatar(
                  backgroundColor: Colors.blue,
                  child: Icon(
                    Icons.add,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
