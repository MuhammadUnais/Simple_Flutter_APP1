import 'package:flutter/material.dart';
import 'package:sample/widgets/themes.dart';
import 'package:velocity_x/velocity_x.dart';

//header code
class CatalogHeader extends StatelessWidget {
  const CatalogHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        "U Catalog App".text.xl5.bold.color(MyTheme.darkbluishColor).make(),
        "Trending Products".text.xl2.make(),
      ],
    );
  }
}
