import 'package:flutter/material.dart';
import 'package:flutter_application_4/homePage/presentation/widgets/music_category_card.dart';

class MusicCategories extends StatelessWidget {
  final List<MusicCategoryCard> categories;
  const MusicCategories({super.key, required this.categories});

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 12.0,
      runSpacing: 12.0,
      children: List.generate(categories.length, (index) => categories[index]),
    );
  }
}
