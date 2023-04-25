import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:holy_quran_app/common/themes.dart';
import 'package:holy_quran_app/domain/entities/dua.dart';
import 'package:holy_quran_app/presentation/blocs/dua_bloc/dua_bloc.dart';
import 'package:holy_quran_app/presentation/ui/widgets/dua_page_widgets.dart/dua_appbar_widget.dart';

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
              child: Container(
                child: _buildDuaExpansions(),
              ),
            );
          }

          return Container();
        },
      ),
    );
  }

  _buildDuaExpansions() {
    return ExpansionPanelList(
      expansionCallback: (panelIndex, isExpanded) {
        setState(() {
          duas[panelIndex].isExpanded = !isExpanded;
        });
      },
      children: duas.map((dua) {
        return ExpansionPanel(
          headerBuilder: (context, isExpanded) =>
              _buildExpansionPanelHeader(dua),
          body: _buildExpansionPanelBody(dua),
          isExpanded: dua.isExpanded,
        );
      }).toList(),
    );
  }

  Padding _buildExpansionPanelHeader(Dua dua) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ListTile(
        leading: Stack(
          alignment: Alignment.center,
          children: [
            SvgPicture.asset('assets/number_icon.svg'),
            Positioned(
              child: Text(dua.id),
            ),
          ],
        ),
        title: Text(dua.dua),
      ),
    );
  }

  ListTile _buildExpansionPanelBody(Dua dua) {
    return ListTile(
      title: Text(
        dua.ayah,
        style: TextStyle(
          fontSize: 24,
          color: appLightPrimaryTextColor,
        ),
        textAlign: TextAlign.end,
      ),
      subtitle: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const SizedBox(height: 8),
            Text(
              dua.latin,
              textAlign: TextAlign.end,
              style: Theme.of(context)
                  .textTheme
                  .bodyMedium!
                  .copyWith(color: appLightPrimaryTextColor),
            ),
            const SizedBox(height: 16),
            Text(
              dua.indonesia,
              textAlign: TextAlign.justify,
            ),
          ],
        ),
      ),
    );
  }
}
