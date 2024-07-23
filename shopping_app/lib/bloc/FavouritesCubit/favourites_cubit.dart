import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stocks_app/model/products_model.dart';

class FavouritesCubit extends Cubit<Favourites> {
  FavouritesCubit() : super(Favourites(products: []));

  void addRemoveFavourites(ProductsModel product) {
    final List<ProductsModel> updatedProducts = List.from(state.products);
    final productExists = updatedProducts.any((element) => element.id == product.id);

    if (productExists) {
      updatedProducts.removeWhere((element) => element.id == product.id);
    } else {
      updatedProducts.add(product);
    }

    emit(Favourites(products: updatedProducts));
  }
}

class Favourites {
  Favourites({required this.products});

  final List<ProductsModel> products;
}
