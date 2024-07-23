import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:stocks_app/model/products_model.dart';

class ProductInformation extends StatelessWidget {
  const ProductInformation({super.key, required this.product});

  final ProductsModel product;

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          product.title,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.shopping_cart,
              size: 30,
            ),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: height * 0.4,
              child: PageView.builder(
                itemCount: product.images.length,
                itemBuilder: (context, index) {
                  return Center(
                    child: AspectRatio(
                      aspectRatio: 1, // Adjust the aspect ratio if needed
                      child: Image(
                          image: NetworkImage(product.images[index]),
                          fit: BoxFit.cover,
                          loadingBuilder: (context, child, loadingProgress) {
                            if (loadingProgress == null) {
                              return child;
                            } else {
                              return Center(
                                child: CircularProgressIndicator(
                                  value: loadingProgress.expectedTotalBytes != null
                                      ? loadingProgress.cumulativeBytesLoaded /loadingProgress.expectedTotalBytes!
                                      : null,
                                ),
                              );
                            }
                          },
                        ),
                    ),
                  );
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: RatingBar.builder(
                      itemCount: 5,
                      initialRating: product.rating,
                      direction: Axis.horizontal,
                      allowHalfRating: true,
                      itemBuilder: (context, index) {
                        return const Icon(
                          Icons.star,
                          color: Colors.amber,
                        );
                      },
                      ignoreGestures: true,
                      onRatingUpdate: (double value) {},
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    product.description,
                    style: const TextStyle(fontSize: 16),
                  ),
                  const SizedBox(height: 16),
                  Text(
                    "Category : ${product.category}",
                    style: const TextStyle(fontSize: 16),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    "Price : \$ ${product.price}",
                    style: const TextStyle(fontSize: 16, color: Colors.green),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    "Discount : ${product.discountPercentage}%",
                    style: const TextStyle(fontSize: 16, color: Colors.red),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    "Stock : ${product.stock}",
                    style: TextStyle(
                      fontSize: 16,
                      color: product.stock > 0 ? Colors.green : Colors.red,
                    ),
                  ),
                  const Divider(
                    height: 50,
                  ),
                  const Text(
                    "Tags",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  Wrap(
                    spacing: 8.0,
                    children: product.tags
                        .map(
                          (tag) => Chip(
                            label: Text(tag),
                          ),
                        )
                        .toList(),
                  ),
                  const Divider(
                    height: 50,
                  ),
                  const Text(
                    "Reviews",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  ...product.reviews.map((review) {
                    return ListTile(
                      leading: const Icon(
                        Icons.person,
                        size: 30,
                      ),
                      title: Text(review.reviewerName),
                      subtitle: Text(review.comment),
                      trailing: RatingBar.builder(
                        itemCount: 5,
                        itemSize: 20,
                        initialRating: review.rating,
                        direction: Axis.horizontal,
                        allowHalfRating: true,
                        itemBuilder: (context, index) {
                          return const Icon(
                            Icons.star,
                            color: Colors.amber,
                          );
                        },
                        ignoreGestures: true,
                        onRatingUpdate: (double rating){},
                      ),
                    );
                  }),
                ],
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {},
        label: const Text('Buy',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
        backgroundColor: Colors.greenAccent,
      ),
    );
  }
}
