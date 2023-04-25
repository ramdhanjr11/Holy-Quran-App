import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:holy_quran_app/presentation/blocs/dua_bloc/dua_bloc.dart';
import 'package:holy_quran_app/presentation/ui/widgets/dua_page_widgets.dart/dua_expansion_widget.dart';

class DuaSearch extends SearchDelegate {
  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
        onPressed: () {
          query = '';
        },
        icon: const Icon(Icons.close),
      )
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      onPressed: () => Navigator.pop(context),
      icon: const Icon(Icons.arrow_back),
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    final duas = context.read<DuaBloc>().duas;
    final resultSearch =
        duas.where((dua) => dua.dua.toLowerCase().contains(query)).toList();

    if (resultSearch.isEmpty) {
      return const Center(
        child: Text('Dua is not found'),
      );
    }
    return SingleChildScrollView(
      child: DuaExpansion(duas: resultSearch),
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return Container();
  }
}
