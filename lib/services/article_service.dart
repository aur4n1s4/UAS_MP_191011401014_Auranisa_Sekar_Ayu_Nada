import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:uas_mp_app/models/article_model.dart';

class ArticleService {
  Future<List<ArticleModel>> getArticle() async {
    try {
      final response = await http.get(Uri.parse('https://api.indosiana.com/api/articles'));
      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        final article = data['data'];
        return article.map<ArticleModel>((json) => ArticleModel.fromJson(json)).toList();
      } else {
        throw Exception('Failed to load article');
      }
    } catch (e) {
      rethrow;
    }
  }

  Future<ArticleModel> getArticleDetail(int idArticle) async {
    try {
      final response = await http.get(Uri.parse('https://api.indosiana.com/api/articles/$idArticle'));
      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        final article = data['data'][0];
        return ArticleModel.fromJson(article);
      } else {
        throw Exception('Failed to load article');
      }
    } catch (e) {
      rethrow;
    }
  }
}
