import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:sample/models/catalog.dart';
import 'package:sample/widgets/home_widgets/add_to_cart.dart';
import 'package:sample/widgets/themes.dart';
import 'package:velocity_x/velocity_x.dart';

class HomeDetailPage extends StatelessWidget {
  final Item catalog;
  const HomeDetailPage({Key? key, required this.catalog})
      : assert(catalog != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: MyTheme.darkbluishColor,
        iconTheme: IconThemeData(color: context.theme.cardColor),
        title: "U Products".text.make(),
      ),
      backgroundColor: context.canvasColor,
      bottomNavigationBar: Container(
        color: context.cardColor,
        child: ButtonBar(
          alignment: MainAxisAlignment.spaceEvenly,
          buttonPadding: EdgeInsets.zero,
          children: [
            "Price: \$${catalog.price}".text.bold.xl3.blue900.make(),
            AddToCart(catalog: catalog).wh(115, 50)
          ],
        ).p12(),
      ),
      body: SafeArea(
        bottom: false,
        child: Column(
          children: [
            Hero(
                    tag: Key(catalog.id.toString()),
                    child: Image.network(catalog.image))
                .h40(context),
            Expanded(
              child: VxArc(
                height: 30.0,
                arcType: VxArcType.CONVEY,
                edge: VxEdge.TOP,
                child: Container(
                  color: context.cardColor,
                  width: (context).screenWidth,
                  child: Column(
                    children: [
                      catalog.name.text.xl4.bold
                          .color(MyTheme.darkbluishColor)
                          .make(),
                      catalog.desc.text.xl.caption(context).coolGray500.make(),
                      "*********************************".text.make(),
                      30.heightBox,
                      "Product Id: ${catalog.id}".text.xl.orange500.make(),
                      "Product Name:${catalog.name}".text.xl.orange500.make(),
                      "Product descrption: ${catalog.desc}"
                          .text
                          .xl
                          .orange500
                          .make(),
                      "Product colour: ${catalog.color}"
                          .text
                          .xl
                          .orange500
                          .make()
                    ],
                  ).py32(),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
