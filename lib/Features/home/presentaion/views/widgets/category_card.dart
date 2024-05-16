import 'package:flutter/material.dart';
import 'package:news_app/Features/home/presentaion/views/category_view.dart';

import '../../../../../core/models/category_data.dart';

class CategoryCard extends StatelessWidget {
  const CategoryCard({
    super.key,
    required this.categoryData,
  });

  final CategoryData categoryData;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => CategoryView(text: categoryData.text)));
      },
      child: Padding(
        padding: const EdgeInsets.only(left: 15, right: 15),
        child: Container(
          width: MediaQuery.sizeOf(context).width * 0.4,
          decoration: BoxDecoration(
            image: DecorationImage(
              fit: BoxFit.fill,
              image: AssetImage(
                categoryData.image,
              ),
            ),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Center(
            child: Text(
              categoryData.text,
              style: const TextStyle(
                color: Color.fromARGB(229, 255, 255, 255),
                fontSize: 19,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
