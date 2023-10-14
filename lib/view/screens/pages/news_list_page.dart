import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

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
              // TODO カテゴリーチップス
              //CategoryChips(),
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
}
