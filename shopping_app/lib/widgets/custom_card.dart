import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stocks_app/bloc/FavouritesCubit/favourites_cubit.dart';
import 'package:stocks_app/bloc/ProductBloc/product_state.dart';
import 'package:stocks_app/model/products_model.dart';
import 'package:stocks_app/view/product_screens/product_information.dart';
import '../bloc/ProductBloc/product_bloc.dart';

class CustomCard extends StatelessWidget {
  const CustomCard({
    super.key,
    required this.cardWidth,
    required this.product,
  });

  final double cardWidth;
  final ProductsModel product;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductBloc, ProductState>(builder: (context, state) {
      if (state is ProductStateLoadedState) {
        return Padding(
          padding: const EdgeInsets.all(5.0),
          child: Center(
            child: SizedBox(
              width: cardWidth,
              child: Card(
                child: Stack(
                  children: [
                    Column(
                      children: [
                        Expanded(
                          flex: 1,
                          child: AspectRatio(
                            aspectRatio: 1,
                            child: Image(
                              image: NetworkImage(product.thumbnail),
                              fit: BoxFit.contain,
                              loadingBuilder:
                                  (context, child, loadingProgress) {
                                if (loadingProgress == null) {
                                  return child;
                                } else {
                                  return Center(
                                    child: CircularProgressIndicator(
                                      value:
                                          loadingProgress.expectedTotalBytes != null
                                              ? loadingProgress.cumulativeBytesLoaded / loadingProgress.expectedTotalBytes!
                                              : null,
                                    ),
                                  );
                                }
                              },
                            ),
                          ),
                        ),
                        Expanded(
                          flex: 1,
                          child: Container(
                            width: cardWidth,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    Expanded(
                                      flex: 4,
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.all(10.0),
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  product.title,
                                                  maxLines: 1,
                                                  style: const TextStyle(
                                                      fontSize: 16,
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),
                                                Text(
                                                  product.brand == 'null'
                                                      ? ''
                                                      : product.brand,
                                                  style: const TextStyle(
                                                    fontSize: 14,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    BlocBuilder<FavouritesCubit, Favourites>(
                                      builder: (context, state) {
                                        return Expanded(
                                          flex: 1,
                                          child: Container(
                                            decoration: const BoxDecoration(
                                                color: Colors.transparent,
                                                shape: BoxShape.circle
                                            ),
                                            child: Center(
                                              child: IconButton(
                                                onPressed: () => context.read<FavouritesCubit>().addRemoveFavourites(product),
                                                icon: state.products.contains(product) ? const Icon(Icons.favorite_rounded) : const Icon(Icons.favorite_outline),
                                              ),
                                            ),
                                          ),
                                        );
                                      },
                                    ),
                                  ],
                                ),
                                Padding(
                                  padding:
                                      const EdgeInsets.fromLTRB(10, 0, 0, 0),
                                  child: Text(
                                    '\$ ${product.price.toString()}',
                                    style: const TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                    Positioned(
                      right: 8,
                      bottom: 5,
                      child: Container(
                        constraints: BoxConstraints(
                          maxWidth: cardWidth / 2,
                        ),
                        child: TextButton(
                          style: ButtonStyle(
                            backgroundColor: WidgetStateProperty.all(
                              const Color(0xFFF58686),
                            ),
                          ),
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        ProductInformation(product: product)));
                          },
                          child: const Text(
                            'Buy Now',
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        );
      }
      return const Text('Loading..');
    });
  }
}
