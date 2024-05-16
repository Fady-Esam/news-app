import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../../data/models/article_model.dart';

class NewsTile extends StatefulWidget {
  const NewsTile({super.key, required this.articles});

  final ArticleModel articles;

  @override
  State<NewsTile> createState() => _NewsTileState();
}

class _NewsTileState extends State<NewsTile> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
      child: Column(
        children: [
          widget.articles.image != null
              ? Hero(
                  tag: widget.articles.title!,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: CachedNetworkImage(
                      height: MediaQuery.sizeOf(context).height * 0.25,
                      width: double.infinity,
                      fit: BoxFit.fill,
                      placeholder: (context, url) {
                        return const Center(child: CircularProgressIndicator());
                      },
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
                      imageUrl: widget.articles.image!,
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
          const SizedBox(height: 10),
          if (widget.articles.title != null)
            Text(
              widget.articles.title!,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w600,
              ),
            ),
          const SizedBox(height: 5),
          if (widget.articles.subTitle != null)
            Text(
              widget.articles.subTitle!,
              maxLines: 3,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(
                color: Colors.grey,
                fontSize: 15,
                fontWeight: FontWeight.w500,
              ),
            ),
        ],
      ),
    );
  }
}
