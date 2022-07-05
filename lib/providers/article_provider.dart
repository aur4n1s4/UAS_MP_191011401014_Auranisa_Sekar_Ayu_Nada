import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:uas_mp_app/models/article_model.dart';
import 'package:uas_mp_app/services/article_service.dart';

class ArticleProvider extends ChangeNotifier {
  bool loading = true;
  bool loading2 = true;
  ArticleProvider() {
    getArticle();
  }

  final ArticleService _articleService = ArticleService();
  List<ArticleModel>? articles;
  ArticleModel? article;

  getArticle() async {
    articles = await _articleService.getArticle();
    loading = false;
    notifyListeners();
  }

  getArticleDetail(int idArticle) async {
    article = await _articleService.getArticleDetail(idArticle);
    loading2 = false;
    notifyListeners();
  }
}
