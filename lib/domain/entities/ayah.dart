// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';

class Ayah extends Equatable {
  final int ayahId;
  final String arabText;
  final String latinText;
  final String indonesiaText;
  final String audio;
  bool isSaved;

  Ayah({
    required this.ayahId,
    required this.arabText,
    required this.latinText,
    required this.indonesiaText,
    required this.audio,
    this.isSaved = false,
  });

  @override
  List<Object> get props => [
        ayahId,
        arabText,
        latinText,
        indonesiaText,
        audio,
        isSaved,
      ];
}
