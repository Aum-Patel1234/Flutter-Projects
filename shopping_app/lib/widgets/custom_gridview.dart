import 'package:flutter/material.dart';
import 'package:stocks_app/model/products_model.dart';
import 'package:stocks_app/widgets/custom_card.dart';

class CustromProductGridView extends StatelessWidget {
  const CustromProductGridView({
    super.key,
    required this.products,
  });

  final Set<ProductsModel> products;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemCount: products.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 10,
        crossAxisSpacing: 10,
        childAspectRatio: 0.75,
      ),
      itemBuilder: (context, index) {
        return CustomCard(
          cardWidth: 200,
          product: products.elementAt(index),
        );
      },
    );
  }
}
