
import 'package:flutter/material.dart';
import 'package:stocks_app/view/product_screens/products_body.dart';

class ProductsSectionScreen extends StatelessWidget {
  const ProductsSectionScreen({super.key, required this.category});

  final String category;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(category.toUpperCase()),
      ),
      body: const ProductsBody(),
    );
  }
}

