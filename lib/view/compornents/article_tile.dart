import 'package:flutter/material.dart';
import 'package:retry_news_feed/view/compornents/image_from_url.dart';

import '../../models/model/news_model.dart';

class ArticleTile extends StatelessWidget {
  final Article article;
  final ValueChanged onArticleClicked;

  const ArticleTile({required this.article, required this.onArticleClicked});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 8.0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: InkWell(
          onTap: () => onArticleClicked(article),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                flex: 1,
                child: Padding(
                  padding: EdgeInsets.all(8.0),
                  child: ImageFromUrl(imageUrl: article.urlToImage,),
                ),
              ),
              Expanded(
                flex: 3,
                child: Column(
                  children: [
                    Text(article.title ?? ""),
                    Text(article.publishDate ?? ""),
                    Text(article.description ?? ""),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
