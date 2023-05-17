import 'package:flutter/material.dart';
import 'package:flutter_spotify_africa_assessment/features/models/categories_model.dart';
import 'package:flutter_spotify_africa_assessment/routes.dart';

class CategoryCard extends StatelessWidget {
  const CategoryCard({super.key, required this.categories});
  final List<Categories> categories;
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
      ),
      itemCount: categories.length,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: GestureDetector(
            onTap: () => {
              Navigator.pushNamed(context, AppRoutes.spotifyPlaylist,
                  arguments: categories[index].id)
            },
            child: IntrinsicHeight(
              child: Card(
                child: Expanded(
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(8),
                          child: Image.network(
                            categories[index].imageUrl,
                            width: MediaQuery.of(context).size.width / 2,
                            height: MediaQuery.of(context).size.width / 2.8,
                            fit: BoxFit.fill,
                          ),
                        ),
                        Text(
                          categories[index].name,
                          style: const TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w400,
                          ),
                        )
                      ]),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
