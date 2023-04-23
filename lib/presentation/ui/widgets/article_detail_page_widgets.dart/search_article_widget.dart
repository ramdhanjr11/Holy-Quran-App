import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:holy_quran_app/presentation/blocs/search_article_bloc/search_article_bloc.dart';
import 'package:holy_quran_app/presentation/ui/widgets/article_page_widgets/article_tile_widget.dart';

class SearchArticle extends SearchDelegate {
  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
        onPressed: () {
          query = '';
        },
        icon: const Icon(Icons.close),
      ),
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      onPressed: () => Navigator.pop(context),
      icon: const Icon(
        Icons.arrow_back,
      ),
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    final searchArticleBloc = context.read<SearchArticleBloc>();
    searchArticleBloc.add(OnQueryingArticle(query: query));

    if (query.isEmpty) {
      return const Center(
        child: Text('Begin to search the article...'),
      );
    }
    return BlocBuilder<SearchArticleBloc, SearchArticleState>(
      builder: (context, state) {
        if (state is SearchArticleLoading) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }

        if (state is SearchArticleError) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }

        if (state is SearchArticleLoaded) {
          final articles = state.articles;
          return ListView.builder(
            itemBuilder: (context, index) =>
                ArticleTile(article: articles[index]),
            itemCount: articles.length,
          );
        }

        return Container();
      },
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return Container();
  }
}
