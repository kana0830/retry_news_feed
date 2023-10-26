import 'package:flutter/material.dart';
import 'package:retry_news_feed/models/model/news_model.dart';

class ArticleTileDesc extends StatelessWidget {

  final Article article;
  const ArticleTileDesc({required this.article});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(article.title ?? ""),
        Text(article.publishDate ?? ""),
        Text(article.description ?? ""),
      ],
    );
  }
}
