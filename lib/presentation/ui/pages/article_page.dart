import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:holy_quran_app/presentation/blocs/article_bloc/article_bloc.dart';
import 'package:holy_quran_app/presentation/ui/widgets/article_page_widgets/article_appbar_widget.dart';
import 'package:holy_quran_app/presentation/ui/widgets/article_page_widgets/article_tile_widget.dart';

class ArticlePage extends StatefulWidget {
  const ArticlePage({super.key});

  @override
  State<ArticlePage> createState() => _ArticlePageState();
}

class _ArticlePageState extends State<ArticlePage> {
  @override
  void initState() {
    super.initState();
    context.read<ArticleBloc>().add(GetArticlesEvent());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: NestedScrollView(
        headerSliverBuilder: (context, innerBoxIsScrolled) => [
          const ArticleAppbar(),
        ],
        body: BlocBuilder<ArticleBloc, ArticleState>(
          builder: (context, state) {
            if (state is ArticleLoading) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            if (state is ArticleError) {
              return Center(
                child: Text(state.message, textAlign: TextAlign.center),
              );
            }
            if (state is ArticleLoaded) {
              final articles = state.articles;
              return ListView.builder(
                padding: const EdgeInsets.all(0),
                itemBuilder: (context, index) {
                  final article = articles[index];
                  return ArticleTile(article: article);
                },
                itemCount: articles.length,
              );
            }
            return Container();
          },
        ),
      ),
    );
  }
}
