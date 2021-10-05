import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

//catalog image code
class CatalogImage extends StatelessWidget {
  final String image;

  const CatalogImage({Key? key, required this.image}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Image.network(
      image,
    ).box.roundedLg.color(context.canvasColor).make().p8().w40(context);
  }
}
