import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:holy_quran_app/common/themes.dart';
import 'package:holy_quran_app/presentation/blocs/ayah_bloc/ayah_bloc.dart';
import 'package:holy_quran_app/presentation/ui/widgets/ayah_item_widget.dart';

class SavedAyahPage extends StatefulWidget {
  static const routeName = '/saved_ayah_page';

  const SavedAyahPage({super.key});

  @override
  State<SavedAyahPage> createState() => _SavedAyahPageState();
}

class _SavedAyahPageState extends State<SavedAyahPage> {
  @override
  void initState() {
    super.initState();
    context.read<AyahBloc>().add(GetAllSavedAyahEvent());
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.grey,
          ),
        ),
        centerTitle: false,
        elevation: 0,
        title: Text(
          'Saved Ayah',
          style: textTheme.titleLarge!.copyWith(
            color: appLightPrimaryColor,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: BlocBuilder<AyahBloc, AyahState>(
        builder: (context, state) {
          if (state is AyahLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is AyahError) {
            return Center(
              child: Text(
                state.message,
                textAlign: TextAlign.center,
              ),
            );
          } else if (state is AyahLoaded) {
            return ListView.builder(
              itemBuilder: (context, index) {
                final ayah = state.ayahList[index];
                return Dismissible(
                  key: ValueKey(ayah.number),
                  onDismissed: (direction) {
                    context.read<AyahBloc>().add(RemoveAyahEvent(id: ayah.id));
                  },
                  background: Container(
                    color: Colors.red,
                    child: const Center(
                      child: Text(
                        'Remove',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  child: AyahItem(ayah: ayah),
                );
              },
              itemCount: state.ayahList.length,
            );
          } else {
            return const Center(
              child: Text('Ooops something went wrong..'),
            );
          }
        },
      ),
    );
  }
}
