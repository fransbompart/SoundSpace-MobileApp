import 'package:flutter/material.dart';

import 'package:overlapped_carousel/overlapped_carousel.dart';
import 'package:flutter_application_4/artist/presentation/widgets/cover.dart';

class CarouselWidget extends StatefulWidget {
  final double currentHeight;
  final double currentWidth;
  const CarouselWidget(
      {super.key, required this.currentHeight, required this.currentWidth});

  @override
  State<CarouselWidget> createState() => _CarouselWidgetState();
}

class _CarouselWidgetState extends State<CarouselWidget> {
  @override
  Widget build(BuildContext context) {
    final widgets = [
      CoverImg(
          currentWidth: widget.currentWidth,
          url: "images/CesarCedeDramaQueen1.jpeg"),
      CoverImg(
          currentWidth: widget.currentWidth,
          url: "images/CesarCedeTalvez.jpeg"),
      CoverImg(
          currentWidth: widget.currentWidth,
          url: "images/CesarCedeImagina.jpeg"),
      CoverImg(
          currentWidth: widget.currentWidth,
          url: "images/CesarCedeDomingo.jpeg"),
      CoverImg(
          currentWidth: widget.currentWidth,
          url: "images/CesarCedeDramaQueen2.jpeg")
    ];

    return SizedBox(
      height: widget.currentHeight * 22 / 100,
      child: SizedBox(
        child: OverlappedCarousel(
          widgets: widgets, //List of widgets
          currentIndex: 2,
          onClicked: (index) {},
        ),
      ),
    );
  }
}
