import 'package:flutter/material.dart';

class CategoryModel {
  String name;
  String iconPath;
  Color boxColor;

  CategoryModel(
      {required this.name, required this.iconPath, required this.boxColor});

  static List<CategoryModel> getCategories() {
    List<CategoryModel> categories = [];
    categories.add(CategoryModel(
        name: 'HipHop',
        iconPath: 'assets/icons/rap.svg',
        boxColor: Colors.yellow));
    categories.add(CategoryModel(
        name: 'Pop',
        iconPath: 'assets/icons/pop.svg',
        boxColor: Colors.blueAccent));
    categories.add(CategoryModel(
        name: 'Jazz',
        iconPath: 'assets/icons/jazz.svg',
        boxColor: Colors.pinkAccent));
    categories.add(CategoryModel(
        name: 'Rock',
        iconPath: 'assets/icons/rock.svg',
        boxColor: Colors.green));

    return categories;
  }
}
