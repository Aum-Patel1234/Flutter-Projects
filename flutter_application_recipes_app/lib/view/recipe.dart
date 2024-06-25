import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_application_recipes_app/model/recipes_model.dart';
import 'package:url_launcher/url_launcher.dart';

class Recipe extends StatelessWidget {
  const Recipe({super.key, required this.recipe});

  final RecipeModel recipe;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(recipe.name),
        actions: [
          IconButton(
            onPressed: () async {
              final Uri url = Uri(
                scheme: 'tel',
                path: '1234567890',
              );
              try {
                await launchUrl(url);
              } catch (e) {
                log('Error: $e');
              }
            },
            icon: const Icon(Icons.call),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.network(recipe.imagelink,
                width: double.infinity, fit: BoxFit.cover),

            // Top Section with Key Details
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    recipe.name,
                    style: Theme.of(context).textTheme.displaySmall,
                  ),
                  const SizedBox(height: 8.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      _buildKeyDetail(Icons.access_time,
                          "${recipe.prepTimeMinutes + recipe.cookTimeMinutes} mins"),
                      _buildKeyDetail(
                          Icons.restaurant_menu, "${recipe.servings} servings"),
                      _buildKeyDetail(Icons.thermostat, recipe.difficulty),
                    ],
                  ),
                  const SizedBox(height: 8.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      _buildKeyDetail(Icons.local_fire_department,
                          "${recipe.caloriesPerServing} kcal"),
                      _buildKeyDetail(Icons.star,
                          "${recipe.rating} (${recipe.reviewCount} reviews)"),
                      _buildKeyDetail(Icons.flag, recipe.cuisine),
                    ],
                  ),
                ],
              ),
            ),

            const SizedBox(
              height: 20,
            ),

            // Ingredients Section
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Text(
                "Ingredients",
                style: Theme.of(context).textTheme.headlineMedium,
              ),
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: recipe.ingredients.map((ingredient) {
                  return Text("\t\t\t• $ingredient",
                      style: Theme.of(context).textTheme.bodyLarge);
                }).toList(),
              ),
            ),

            const SizedBox(
              height: 30,
            ),

            // Instructions Section
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Text(
                "Instructions",
                style: Theme.of(context).textTheme.headlineMedium,
              ),
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: recipe.instructions.asMap().entries.map((entry) {
                  int index = entry.key + 1;
                  String instruction = entry.value;
                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 4.0),
                    child: Text("$index. $instruction",
                        style: Theme.of(context).textTheme.bodyLarge),
                  );
                }).toList(),
              ),
            ),

            // Tags Section
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
              child: Wrap(
                spacing: 8.0,
                children: recipe.tags.map((tag) {
                  return Chip(label: Text(tag));
                }).toList(),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          final Uri emailUri = Uri(
            scheme: 'mailto',
            path: 'example@example.com',
          );

          try {
            await launchUrl(emailUri);
          } catch (e) {
            log('Error: $e');
          }
        },
        child: const Icon(Icons.email),
      ),
    );
  }

  Widget _buildKeyDetail(IconData icon, String detail) {
    return Row(
      children: [
        Icon(icon, size: 18.0),
        const SizedBox(width: 4.0),
        Text(detail, style: const TextStyle(fontSize: 16.0)),
      ],
    );
  }
}
