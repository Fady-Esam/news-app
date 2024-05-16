import 'package:flutter/material.dart';
import 'package:news_app/core/utils/category_data_list.dart';
import 'category_card.dart';

class CategoriesListView extends StatelessWidget {
  const CategoriesListView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.sizeOf(context).height * 0.125,
      child: ListView.builder(
        itemCount: categoryDataList.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return CategoryCard(categoryData: categoryDataList[index]);
        },
      ),
    );
  }
}
