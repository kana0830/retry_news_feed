import 'package:flutter/material.dart';
import 'package:retry_news_feed/data/category_info.dart';
import '../../compornents/category_chips.dart';

class NewsListPage extends StatelessWidget {  
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.refresh),
          tooltip: "更新",
          onPressed: () => onFresh(context),
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              // TODO 検索ワード
              SearchBar(
                controller: TextEditingController(),
                leading: Icon(Icons.search, color: Colors.white60,),
                hintText: "検索ワードを入れてください",
                hintStyle: MaterialStateProperty.all(TextStyle(color: Colors.white60)),
                onSubmitted: (keyWord) => getKeywordNews(context, keyWord),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: CategoryChips(
                  onCategorySelected: (category) => getCategoryNews(context, category),
                ),
              ),
              // TODO 記事表示
              Expanded(
                child: Center(
                  child: CircularProgressIndicator(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // TODO
  onFresh(BuildContext context) {}
  // TODO
  getKeywordNews(BuildContext context, String keyWord) {
    print("News");
  }
  // TODO
  getCategoryNews(BuildContext context, category) {
    print("category");
  }
}
