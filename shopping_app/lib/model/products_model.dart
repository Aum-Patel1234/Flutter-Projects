class ProductsModel {
  ProductsModel({
    required this.id,
    required this.title,
    required this.description,
    required this.category,
    required this.price,
    required this.discountPercentage,
    required this.rating,
    required this.stock,
    required this.tags,
    required this.brand,
    required this.sku,
    required this.weight,
    required this.dimensions,
    required this.warrantyInformation,
    required this.shippingInformation,
    required this.availabilityStatus,
    required this.reviews,
    required this.returnPolicy,
    required this.minimumOrderQuantity,
    required this.meta,
    required this.images,
    required this.thumbnail,
  });

  final int id;
  final String title;
  final String description;
  final String category;
  final double price;
  final double discountPercentage;
  final double rating;
  final int stock;
  final List<String> tags;
  final String brand;
  final String sku;
  final double weight;
  final Map<String, double> dimensions;
  final String warrantyInformation;
  final String shippingInformation;
  final String availabilityStatus;
  final List<Review> reviews;
  final String returnPolicy;
  final int minimumOrderQuantity;
  final Map<String, String> meta;
  final List<String> images;
  final String thumbnail;

  factory ProductsModel.fromMap(Map<String, dynamic> map) {
    return ProductsModel(
      id: map['id'] as int,
      title: map['title'] as String,
      description: map['description'] as String,
      category: map['category'] as String,
      price: (map['price'] as num).toDouble(),
      rating: (map['rating']?? 0).toDouble(),
      discountPercentage: (map['discountPercentage'] as num).toDouble(),
      stock: map['stock'] as int,
      tags: List<String>.from(map['tags']),
      brand: map['brand'].toString(),
      sku: map['sku'] as String,
      weight: (map['weight'] as num).toDouble(),
      dimensions: Map<String, double>.from(map['dimensions'].map((k, v) => MapEntry(k, (v as num).toDouble()))),
      warrantyInformation: map['warrantyInformation'] as String,
      shippingInformation: map['shippingInformation'] as String,
      availabilityStatus: map['availabilityStatus'] as String,
      reviews: (map['reviews'] as List).map(
        (review) => Review.fromMap(review),
      ).toList(),
      returnPolicy: map['returnPolicy'] as String,
      minimumOrderQuantity: map['minimumOrderQuantity'] as int,
      meta: Map<String, String>.from(map['meta']),
      images: List<String>.from(map['images']),
      thumbnail: map['thumbnail'] as String,
    );
  }
}

class Review {
  Review({
    required this.rating,
    required this.comment,
    required this.date,
    required this.reviewerName,
    required this.reviewerEmail,
  });

  final double rating;
  final String comment;
  final String date;
  final String reviewerName;
  final String reviewerEmail;

  factory Review.fromMap(Map<String, dynamic> map) {
    return Review(
      rating: (map['rating'] as num).toDouble(),
      comment: map['comment'] as String,
      date: map['date'] as String,
      reviewerName: map['reviewerName'] as String,
      reviewerEmail: map['reviewerEmail'] as String,
    );
  }
}
