import 'package:flutter/material.dart';

class CoverImg extends StatefulWidget {
  final double currentWidth;
  final String url;

  CoverImg({
    super.key,
    required this.currentWidth,
    required this.url,
  });

  @override
  State<CoverImg> createState() => _CoverImgState();
}

class _CoverImgState extends State<CoverImg> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: widget.currentWidth,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: Image(
          image: AssetImage(widget.url),
          fit: BoxFit.fill,
        ),
      ),
    );
  }
}
