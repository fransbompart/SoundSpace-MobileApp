import 'package:flutter/material.dart';

class PromotionalBanner extends StatefulWidget {
  final String imgPath;
  //final String redirectUrl;

  const PromotionalBanner({super.key, required this.imgPath});

  @override
  State<PromotionalBanner> createState() => _PromotionalBannersState();
}

class _PromotionalBannersState extends State<PromotionalBanner> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Center(
      child: GestureDetector(
        onTap: () {},
        child: ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: Image.network(
            widget.imgPath,
            width: size.width * 0.92,
            height: 200,
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
