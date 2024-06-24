class RecipeModel {
  RecipeModel({
    required this.id,
    required this.name,
    required this.ingredients,
    required this.instructions,
    required this.prepTimeMinutes,
    required this.cookTimeMinutes,
    required this.servings,
    required this.difficulty,
    required this.cuisine,
    required this.caloriesPerServing,
    required this.tags,
    required this.userId,
    required this.imagelink,
    required this.rating,
    required this.reviewCount,
    required this.mealType,
  });

  final int id;
  final String name;
  final List<String> ingredients;
  final List<String> instructions;
  final int prepTimeMinutes;
  final int cookTimeMinutes;
  final int servings;
  final String difficulty;
  final String cuisine;
  final int caloriesPerServing;
  final List<String> tags;
  final int userId;
  final String imagelink;
  final double rating;
  final int reviewCount;
  final List<String> mealType;

  factory RecipeModel.fromJSON(Map<String, dynamic> map) {
    return RecipeModel(
      id: map['id'],
      name: map['name'],
      ingredients: List<String>.from(map['ingredients']),
      instructions: List<String>.from(map['instructions']),
      prepTimeMinutes: map['prepTimeMinutes'],
      cookTimeMinutes: map['cookTimeMinutes'],
      servings: map['servings'],
      difficulty: map['difficulty'],
      cuisine: map['cuisine'],
      caloriesPerServing: map['caloriesPerServing'],
      tags: List<String>.from(map['tags']),
      userId: map['userId'],
      imagelink: map['image'],
      rating: map['rating'].toDouble(),
      reviewCount: map['reviewCount'],
      mealType: List<String>.from(map['mealType']),
    );
  }
}


// {      "id": 1,
//       "name": "Classic Margherita Pizza",
//       "ingredients": [
//         "Pizza dough",
//         "Tomato sauce",
//         "Fresh mozzarella cheese",
//         "Fresh basil leaves",
//         "Olive oil",
//         "Salt and pepper to taste"
//       ],
//       "instructions": [
//         "Preheat the oven to 475°F (245°C).",
//         "Roll out the pizza dough and spread tomato sauce evenly.",
//         "Top with slices of fresh mozzarella and fresh basil leaves.",
//         "Drizzle with olive oil and season with salt and pepper.",
//         "Bake in the preheated oven for 12-15 minutes or until the crust is golden brown.",
//         "Slice and serve hot."
//       ],
//       "prepTimeMinutes": 20,
//       "cookTimeMinutes": 15,
//       "servings": 4,
//       "difficulty": "Easy",
//       "cuisine": "Italian",
//       "caloriesPerServing": 300,
//       "tags": [
//         "Pizza",
//         "Italian"
//       ],
//       "userId": 166,
//       "image": "https://cdn.dummyjson.com/recipe-images/1.webp",
//       "rating": 4.6,
//       "reviewCount": 98,
//       "mealType": [
//         "Dinner"
//       ]
//     }