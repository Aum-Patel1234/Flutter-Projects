import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stocks_app/bloc/ProductCategoryBloc/category_bloc.dart';
import 'package:stocks_app/bloc/ProductCategoryBloc/category_event.dart';
import 'package:stocks_app/model/products_model.dart';
import 'package:stocks_app/view/product_screens/products_screen.dart';
import 'package:stocks_app/widgets/custom_card.dart';

class Categories extends StatelessWidget {
  const Categories({
    super.key,
    required this.category, required this.products,
  });
  final String category;
  final List<ProductsModel> products;

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return Padding(
      padding: const EdgeInsets.fromLTRB(10, 0, 0, 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextButton(
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => ProductsSectionScreen(category: category,)));
              context.read<CategoryBloc>().add(CategoryEventGetSectionProducts(section: category));
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  category.toUpperCase(),
                  style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                ),
                const Icon(Icons.arrow_forward),
              ],
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          SizedBox(
            height: height * 0.3,
            child: ListView.builder(
              itemCount: products.length > 5 ? 5 : products.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return CustomCard(cardWidth: 200,product: products.elementAt(index),);
              },
            ),
          ),
        ],
      ),
    );
  }
}
