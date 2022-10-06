import 'package:flutter/material.dart';

class CategoryModel {
  String category;
  IconData? icon;

  CategoryModel({this.category = '', this.icon});
}

final List<CategoryModel> categories = [
  CategoryModel(category: 'Jobs', icon: Icons.work),
  CategoryModel(category: 'Companies', icon: Icons.dashboard),
  CategoryModel(category: 'Schedule', icon: Icons.calendar_month),
  CategoryModel(category: 'Map', icon: Icons.map),
  CategoryModel(category: 'Event', icon: Icons.event)
];
