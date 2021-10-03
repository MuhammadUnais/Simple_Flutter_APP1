import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:sample/models/catalog.dart';
import 'package:sample/widgets/themes.dart';
import 'package:velocity_x/velocity_x.dart';

class HomeDetailPage extends StatelessWidget {
  final Item catalog;
  const HomeDetailPage({Key? key, required this.catalog})
      : assert(catalog != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    MyTheme.creamColor;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: MyTheme.darkbluishColor,
        iconTheme: IconThemeData(color: MyTheme.creamColor),
      ),
      backgroundColor: MyTheme.creamColor,
      bottomNavigationBar: Container(
        color: Colors.white,
        child: ButtonBar(
          alignment: MainAxisAlignment.spaceEvenly,
          buttonPadding: EdgeInsets.zero,
          children: [
            "Price: \$${catalog.price}".text.bold.xl3.blue900.make(),
            ElevatedButton(
                    onPressed: () {},
                    style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all(MyTheme.darkbluishColor),
                    ),
                    child: "BUY Now".text.make())
                .wh(100, 55)
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
                  color: Colors.white,
                  width: (context).screenWidth,
                  child: Column(
                    children: [
                      catalog.name.text.xl4.bold
                          .color(MyTheme.darkbluishColor)
                          .make(),
                      catalog.desc.text.caption(context).make(),
                      "*********************************"
                          .text
                          .bold
                          .xl2
                          .black
                          .make(),
                      "Product Id: \$${catalog.id}".text.italic.xs.black.make(),
                      "Product Name: \$${catalog.name}"
                          .text
                          .italic
                          .xs
                          .black
                          .make(),
                      "Product descrption: \$${catalog.desc}"
                          .text
                          .italic
                          .xs
                          .black
                          .make(),
                      "Product colour: \$${catalog.color}"
                          .text
                          .italic
                          .xs
                          .black
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
