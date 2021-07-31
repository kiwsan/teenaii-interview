import 'package:flutter/widgets.dart';
import 'package:teenaii/core/widgets/category_card.dart';
import 'package:teenaii/features/category/domain/entities/entities.dart';

class CategoriesListItem extends StatelessWidget {
  const CategoriesListItem({Key? key, required this.category})
      : super(key: key);

  final CategoryEntity category;

  @override
  Widget build(BuildContext context) {
    return CategoryCard(category: category);
  }
}
