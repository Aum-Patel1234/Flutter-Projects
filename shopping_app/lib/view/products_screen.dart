import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stocks_app/bloc/ProductCategoryBloc/category_bloc.dart';
import 'package:stocks_app/bloc/ProductCategoryBloc/category_state.dart';
import 'package:stocks_app/widgets/custom_card.dart';

class ProductsSectionScreen extends StatelessWidget {
  const ProductsSectionScreen({super.key, required this.category});

  final String category;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(category.toUpperCase()),
        ),
        body: BlocBuilder<CategoryBloc, CategoryState>(
          builder: (context, state) {
            if (state is CategoryStateLoading) {
              return const Center(child: CircularProgressIndicator());
            }
            if (state is CategoryStateLoadedState) {
              return GridView.builder(
                itemCount: state.data.products.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 10,
                  crossAxisSpacing: 10,
                  childAspectRatio: 0.75
                ),
                itemBuilder: (context, index) {
                  return CustomCard(cardWidth: 200, product: state.data.products.elementAt(index));
                },
              );
            }
            return const Text('Some Error occured...');
          },
        ));
  }
}
