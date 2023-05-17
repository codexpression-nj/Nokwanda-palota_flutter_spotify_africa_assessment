import 'package:flutter/material.dart';
import 'package:flutter_spotify_africa_assessment/colors.dart';
import 'package:flutter_spotify_africa_assessment/features/about/presentation/components/category_card.dart';
import 'package:flutter_spotify_africa_assessment/features/models/categories_model.dart';
import 'package:flutter_spotify_africa_assessment/features/services/spotify_api.dart';
import 'package:flutter_spotify_africa_assessment/routes.dart';

import '../../../models/category_model.dart';

// TOD: fetch and populate playlist info and allow for click-through to detail
// Feel free to change this to a stateful widget if necessary
class SpotifyCategory extends StatefulWidget {
  final String categoryId;

  const SpotifyCategory({
    Key? key,
    required this.categoryId,
  }) : super(key: key);

  @override
  State<SpotifyCategory> createState() => _SpotifyCategoryState();
}

class _SpotifyCategoryState extends State<SpotifyCategory> {
  late Future<List<Categories>> futureCategory;
  late Future<CategoyModel> categoryDetail;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    futureCategory = fetchCategories();
    categoryDetail = fetchCategory(widget.categoryId);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Center(child: Text(widget.categoryId)),
          actions: [
            IconButton(
              icon: const Icon(Icons.info_outline),
              onPressed: () => Navigator.of(context).pushNamed(AppRoutes.about),
            ),
          ],
          flexibleSpace: Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: <Color>[
                  AppColors.blue,
                  AppColors.cyan,
                  AppColors.green,
                ],
              ),
            ),
          ),
        ),
        body: Container(
            padding: const EdgeInsets.all(8),
            child: Center(
                child: FutureBuilder<List<Categories>>(
                    future: futureCategory,
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        return CategoryCard(categories: snapshot.data!);
                      } else if (snapshot.hasError) {
                        return Text('${snapshot.error}');
                      } else {
                        return const Center(
                          child: CircularProgressIndicator(),
                        );
                      }
                    })
                // child: Text("Text"))),
                )));
  }
}
