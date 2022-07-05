import 'package:flutter/material.dart';
import 'package:uas_mp_app/pages/article_detail_page.dart';
import 'package:uas_mp_app/providers/article_provider.dart';
import 'package:provider/provider.dart';

class ArticlePage extends StatefulWidget {
  const ArticlePage({Key? key}) : super(key: key);

  @override
  State<ArticlePage> createState() => _ArticlePageState();
}

class _ArticlePageState extends State<ArticlePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('191011401014-Auranisa Sekar Ayu Nada'),
      ),
      body: Consumer<ArticleProvider>(
        builder: (context, articleProvider, _) {
          if (articleProvider.loading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else {
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.max,
                children: [
                  const Text(
                    'Artikel Terbaru',
                    style: TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Expanded(
                    child: ListView.builder(
                      itemCount: articleProvider.articles!.length,
                      itemBuilder: (context, index) {
                        final article = articleProvider.articles![index];
                        return Card(
                          child: ListTile(
                            title: Text(article.title),
                            subtitle: Text(article.createdAt),
                            leading: Image.network(
                              article.image,
                              width: 90.0,
                              height: 90.0,
                            ),
                            onTap: () {
                              articleProvider.getArticleDetail(article.id);
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (context) => ArticleDetailPage(
                                    title: article.title,
                                  ),
                                ),
                              );
                            },
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            );
          }
        },
      ),
    );
  }
}
