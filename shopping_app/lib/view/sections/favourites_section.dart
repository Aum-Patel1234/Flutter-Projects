import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stocks_app/bloc/FavouritesCubit/favourites_cubit.dart';
import 'package:stocks_app/widgets/custom_gridview.dart';

class FavouritesSection extends StatelessWidget {
  const FavouritesSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FavouritesCubit,Favourites>(
      builder: (context,state){
        return CustromProductGridView(products: state.products.toSet());
      },
    );
  }
}