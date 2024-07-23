
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stocks_app/bloc/ProductCategoryBloc/category_bloc.dart';
import 'package:stocks_app/bloc/ProductCategoryBloc/category_state.dart';
import 'package:stocks_app/model/products_model.dart';
import 'package:stocks_app/widgets/custom_gridview.dart';

class ProductsBody extends StatefulWidget {
  const ProductsBody({super.key});

  @override
  State<ProductsBody> createState() => _ProductsBodyState();
}

class _ProductsBodyState extends State<ProductsBody> {
  List<bool> selected = [];

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CategoryBloc, CategoryState>(
      builder: (context, state) {
        if (state is CategoryStateLoading) {
          return const Center(child: CircularProgressIndicator());
        }
        if (state is CategoryStateLoadedState) {
          Set<String> getTags = {};
          for (ProductsModel product in state.data.products) {
            getTags.addAll(product.tags);
          }
          List<String> tags = getTags.toList();
          if (selected.isEmpty) {
            selected = List.filled(tags.length, false);
          }

          Set<ProductsModel> products = state.data.products.toSet();
          for (int i = 0; i < tags.length; i++) {
            if (selected[i]) {
              log(tags[i]);
              products = products
                  .where((product) => product.tags.contains(tags[i]))
                  .toSet();
            }
          }

          return Column(
            children: [
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: tags.map(
                    (tag) {
                      int index = tags.indexOf(tag);
                      return Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: FilterChip(
                          label: Text(tag),
                          selected: selected[index],
                          onSelected: (isSelected) {
                            setState(() {
                              selected[index] = isSelected;
                            });
                          },
                        ),
                      );
                    },
                  ).toList(),
                ),
              ),
              Expanded(
                child: CustromProductGridView(products: products),
              ),
            ],
          );
        }
        return const Center(child: Text('Some error occurred...'));
      },
    );
  }
}

