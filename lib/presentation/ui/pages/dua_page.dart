import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:holy_quran_app/domain/entities/dua.dart';
import 'package:holy_quran_app/presentation/blocs/dua_bloc/dua_bloc.dart';
import 'package:holy_quran_app/presentation/ui/widgets/dua_page_widgets.dart/dua_appbar_widget.dart';
import 'package:holy_quran_app/presentation/ui/widgets/dua_page_widgets.dart/dua_expansion_widget.dart';

class DuaPage extends StatefulWidget {
  const DuaPage({super.key});

  @override
  State<DuaPage> createState() => _DuaPageState();
}

class _DuaPageState extends State<DuaPage> {
  late List<Dua> duas;

  @override
  void initState() {
    super.initState();
    context.read<DuaBloc>().add(GetDuas());
  }

  @override
  Widget build(BuildContext context) {
    return NestedScrollView(
      headerSliverBuilder: (context, innerBoxIsScrolled) => [const DuaAppbar()],
      body: BlocBuilder<DuaBloc, DuaState>(
        builder: (context, state) {
          if (state is DuaLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          if (state is DuaError) {
            return Center(
              child: Text(
                state.message,
                textAlign: TextAlign.center,
              ),
            );
          }

          if (state is DuaLoaded) {
            duas = state.duas;
            return SingleChildScrollView(
              child: DuaExpansion(duas: duas),
            );
          }

          return Container();
        },
      ),
    );
  }
}
