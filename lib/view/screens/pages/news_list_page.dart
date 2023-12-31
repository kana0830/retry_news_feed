import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:retry_news_feed/data/category_info.dart';
import 'package:retry_news_feed/data/search_type.dart';
import 'package:retry_news_feed/view/compornents/article_tile.dart';
import 'package:retry_news_feed/viewmodels/news_list_viewmodel.dart';
import '../../../models/model/news_model.dart';
import '../../compornents/category_chips.dart';

class NewsListPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final viewModel = context.read<NewsListViewModel>();

    if (!viewModel.isLoading && viewModel.articles.isEmpty) {
      Future(() => viewModel.getNews(
          searchType: SearchType.CATEGORY, category: categories[0]));
    }

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
                leading: Icon(
                  Icons.search,
                  color: Colors.white60,
                ),
                hintText: "検索ワードを入れてください",
                hintStyle:
                    MaterialStateProperty.all(TextStyle(color: Colors.white60)),
                onSubmitted: (keyWord) => getKeywordNews(context, keyWord),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: CategoryChips(
                  onCategorySelected: (category) =>
                      getCategoryNews(context, category),
                ),
              ),
              // TODO 記事表示
              Expanded(
                child: Consumer<NewsListViewModel>(
                  builder: (context, model, child) {
                    return model.isLoading
                        ? Center(
                            child: CircularProgressIndicator(),
                          )
                        : ListView.builder(
                            itemCount: model.articles.length,
                            itemBuilder: (context, int position) => ArticleTile(
                                article: model.articles[position],
                                onArticleClicked: (article) =>
                                    _openArticleWebPage(article, context)),
                          );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // 記事更新処理
  onFresh(BuildContext context) {
    final viewModel = context.read<NewsListViewModel>();
    viewModel.getNews(
      searchType: viewModel.searchType,
      keyWord: viewModel.keyWord,
      category: viewModel.category,
    );
  }

  // キーワード記事取得処理
  getKeywordNews(BuildContext context, String keyWord) {
    final viewModel = context.read<NewsListViewModel>();
    viewModel.getNews(
      searchType: SearchType.KEYWORD,
      keyWord: keyWord,
      category: categories[0],
    );
  }

  // カテゴリー記事取得処理
  getCategoryNews(BuildContext context, category) {
    final viewModel = context.read<NewsListViewModel>();
    viewModel.getNews(
      searchType: SearchType.CATEGORY,
      category: category,
    );
  }

  _openArticleWebPage(Article article, BuildContext context) {
    print("_openArticleWebPage: ${article.url}");
  }
}
