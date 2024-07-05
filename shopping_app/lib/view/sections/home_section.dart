
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stocks_app/bloc/product_bloc.dart';
import 'package:stocks_app/bloc/product_state.dart';
import 'package:stocks_app/widgets/categories.dart';

class HomeSection extends StatelessWidget {
  const HomeSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductBloc,ProductState>(
      builder: (context, state) {
        if(state is ProductStateLoadingState){
          return const Center(child: CircularProgressIndicator());
        }
        if(state is ProductStateLoadedState){
          return ListView.builder(
            itemCount: state.categoryListModel.categories.length,
            itemBuilder: (context, index) {
              return Categories(category: state.categoryListModel.categories.elementAt(index),products: state.data[index]!.products,);
            },
          );
        }
        return const Center(
          child: Text('No Data Found'),
        );
      },
    );
  }
}