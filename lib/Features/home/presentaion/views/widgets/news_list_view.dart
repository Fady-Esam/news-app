import 'package:flutter/material.dart';
import 'package:news_app/Features/home/presentaion/views/news_item_details_view.dart';
import '../../../data/models/article_model.dart';
import 'news_tile.dart';

class NewsListView extends StatelessWidget {
  const NewsListView({
    super.key,
    required this.articles,
  });

  final List<ArticleModel> articles;

  @override
  Widget build(BuildContext context) {
    return SliverList(
      delegate: SliverChildBuilderDelegate(
        childCount: articles.length,
        (context, index) {
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
      ),
    );
  }
}
