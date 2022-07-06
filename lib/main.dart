import 'package:flutter/material.dart';
import 'package:uas_mp_app/pages/article_page.dart';
import 'package:uas_mp_app/providers/article_provider.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<ArticleProvider>(
      create: (_) => ArticleProvider(),
      child: MaterialApp(
        title: 'UAS MP ',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const ArticlePage(),
      ),
    );
  }
}
