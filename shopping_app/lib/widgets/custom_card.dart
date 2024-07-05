import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stocks_app/bloc/product_state.dart';
import 'package:stocks_app/model/products_model.dart';
import 'package:stocks_app/view/product_information.dart';

import '../bloc/product_bloc.dart';

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
          child: SizedBox(
            width: cardWidth,
            child: Card.filled(
              color: Colors.transparent,
              child: Stack(
                children: [
                  Column(
                    children: [
                      Expanded(
                        flex: 1,
                        child: Image(
                          image: NetworkImage(product.thumbnail),
                          fit: BoxFit.cover,
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
                                      crossAxisAlignment:CrossAxisAlignment.start,
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
                                                product.brand,
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
                                  Expanded(
                                    flex: 1,
                                    child: Container(
                                      decoration: const BoxDecoration(
                                          color: Colors.black12,
                                          shape: BoxShape.circle),
                                      child: IconButton(
                                        onPressed: () {},
                                        icon: const Icon(Icons.shopping_cart),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              Padding(
                                padding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
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
                    right: 10,
                    bottom: 10,
                    child: Container(
                      constraints: BoxConstraints(
                        maxWidth: cardWidth / 2,
                      ),
                      child: TextButton(
                        style: const ButtonStyle(
                          backgroundColor: WidgetStatePropertyAll(
                            Color(0xFFF58686),
                          ),
                        ),
                        onPressed: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context) => ProductInformation(product: product)));
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
        );
      }
      return const Text('Loading..');
    });
  }
}
