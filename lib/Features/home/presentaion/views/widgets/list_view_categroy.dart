import 'package:flutter/material.dart';
import '../../../data/models/article_model.dart';
import '../news_item_details_view.dart';
import 'news_tile.dart';

class ListViewCategory extends StatelessWidget {
  const ListViewCategory({
    super.key,
    required this.articles,
  });

  final List<ArticleModel> articles;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: articles.length,
      physics: const BouncingScrollPhysics(),
      itemBuilder: (context, index) {
        return InkWell(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => NewsItemDetailsView(
                  article: articles[index],
                ),
              ),
            );
          },
          child: NewsTile(
            articles: articles[index],
          ),
        );
      },
    );
  }
}
