import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:holy_quran_app/common/themes.dart';
import 'package:holy_quran_app/domain/entities/dua.dart';

class DuaExpansion extends StatefulWidget {
  final List<Dua> duas;

  const DuaExpansion({super.key, required this.duas});

  @override
  State<DuaExpansion> createState() => _DuaExpansionState();
}

class _DuaExpansionState extends State<DuaExpansion> {
  late List<Dua> duas;

  @override
  void initState() {
    super.initState();
    duas = widget.duas;
  }

  @override
  Widget build(BuildContext context) {
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
