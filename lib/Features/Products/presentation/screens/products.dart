import 'package:flutter/material.dart';
import 'package:productstaskapp/Features/Products/presentation/widgets/grid_produsts.dart';

class Products extends StatelessWidget {
  const Products({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
     appBar: AppBar(
       backgroundColor: Colors.blueAccent,
       title:const Text("All Products" , style: TextStyle(color: Colors.white,fontSize: 26),),
       centerTitle: true,
     ),

      body: GridViewScreen(),
    );

  }
}
