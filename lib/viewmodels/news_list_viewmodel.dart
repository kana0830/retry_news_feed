import 'package:flutter/material.dart';
import 'package:retry_news_feed/data/search_type.dart';
import 'package:retry_news_feed/repository/news_repository.dart';
import '../data/category_info.dart';

class NewsListViewModel extends ChangeNotifier {
  final NewsRepository _repository = NewsRepository();

  SearchType _searchType = SearchType.CATEGORY;

  SearchType get searchType => _searchType;

  Category _category = categories[0];

  Category get category => _category;

  String _keyWord = "";

  String get keyWord => _keyWord;

  bool _isLoading = false;

  bool get isLoading => _isLoading;

  getNews(
      {required SearchType searchType, String? keyWord, Category? category}) {
    _searchType = searchType;
    _keyWord = keyWord ?? "";
    _category = category ?? categories[0];

    _isLoading = true;
    notifyListeners();

    _repository.getNews(
      searchType: _searchType,
      keyWord: _keyWord,
      category: _category,
    );

    _isLoading = false;
  }
}
