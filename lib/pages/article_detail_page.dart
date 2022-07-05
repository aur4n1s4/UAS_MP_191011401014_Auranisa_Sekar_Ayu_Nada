import 'package:flutter/material.dart';
import 'package:uas_mp_app/providers/article_provider.dart';
import 'package:provider/provider.dart';

class ArticleDetailPage extends StatefulWidget {
  const ArticleDetailPage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<ArticleDetailPage> createState() => _ArticleDetailPageState();
}

class _ArticleDetailPageState extends State<ArticleDetailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Consumer<ArticleProvider>(
        builder: (context, articleProvider, _) {
          if (articleProvider.loading2) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else {
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Image.network(articleProvider.article!.image),
                    Text(
                      articleProvider.article!.title,
                      style: const TextStyle(
                        fontSize: 18.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      articleProvider.article!.createdAt,
                      style: const TextStyle(
                        fontSize: 12.0,
                        color: Colors.grey,
                      ),
                    ),
                    Text(articleProvider.article!.description),
                  ],
                ),
              ),
            );
          }
        },
      ),
    );
  }
}
