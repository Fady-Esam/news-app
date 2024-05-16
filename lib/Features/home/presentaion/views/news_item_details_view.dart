import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:news_app/Features/home/data/models/article_model.dart';

class NewsItemDetailsView extends StatelessWidget {
  const NewsItemDetailsView({super.key, required this.article});

  final ArticleModel article;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              article.image != null
                  ? Hero(
                      tag: article.title!,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(12),
                        child: CachedNetworkImage(
                          height: MediaQuery.sizeOf(context).height * 0.25,
                          width: double.infinity,
                          fit: BoxFit.fill,
                          errorWidget: (context, url, error) {
                            return const Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.error,
                                  size: 32,
                                ),
                                SizedBox(height: 12),
                                Text(
                                  'Failed to load image',
                                  style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ],
                            );
                          },
                          placeholder: (context, url) {
                            return Container(
                              alignment: Alignment.center,
                              height: MediaQuery.sizeOf(context).height * 0.25,
                              width: double.infinity,
                              child: const CircularProgressIndicator(),
                            );
                          },
                          imageUrl: article.image!,
                        ),
                      ),
                    )
                  : Container(
                    alignment: Alignment.center,
                    height: MediaQuery.sizeOf(context).height * 0.25,
                    width: double.infinity,
                    child: const Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.error,
                          size: 32,
                        ),
                        SizedBox(height: 12),
                        Text(
                          'Failed to load image',
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                  ),
              const SizedBox(height: 24),
              if (article.title != null)
                Text(
                  article.title!,
                  style: const TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.w900,
                  ),
                ),
              const SizedBox(height: 18),
              if (article.subTitle != null)
                Text(
                  article.subTitle!,
                  style: const TextStyle(
                    fontSize: 19,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              const SizedBox(height: 24),
              if (article.publishedAt != null)
                ConstrainedBox(
                  constraints: BoxConstraints(
                    maxWidth: MediaQuery.sizeOf(context).width * 0.52,
                  ),
                  child: Text(
                    'Published At ${DateFormat.yMd().format(article.publishedAt!)}${article.author != null && article.author != "" && article.author != "F1" ? ', by' : ''}',
                    style: const TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
              if (article.author != null &&
                  article.author != "" &&
                  article.author != "F1")
                ConstrainedBox(
                  constraints: BoxConstraints(
                    maxWidth: MediaQuery.sizeOf(context).width * 0.5,
                  ),
                  child: Text(
                    article.author!,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                      fontStyle: FontStyle.italic,
                    ),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
