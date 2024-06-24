
import 'package:flutter/material.dart';
import 'package:flutter_application_recipes_app/model/recipes_model.dart';
import 'package:flutter_application_recipes_app/view/recipe.dart';

class RecipeTileWidget extends StatelessWidget {
  const RecipeTileWidget({
    super.key, required this.recipe,
  });

  final RecipeModel recipe;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: (){
        Navigator.push(context, MaterialPageRoute(builder: (context) => Recipe(recipe: recipe)));
      },
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: Colors.brown[50],
            borderRadius: BorderRadius.circular(12.0),
            boxShadow: const [
              BoxShadow(
                color: Colors.black26,
                offset: Offset(0, 2),
                blurRadius: 6.0,
              ),
            ],
          ),
          child: ListTile(
            contentPadding: EdgeInsets.zero,
            title: Text(
              recipe.name,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.brown[900],
                // fontSize: 20
              ),
            ),
            subtitle: Text(
              'Rating - ${recipe.rating}',
              style: TextStyle(color: Colors.brown[600]),
            ),
            trailing: ClipOval(
              child: Image.network(
                recipe.imagelink,
                width: 70,
                height: 70,
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
