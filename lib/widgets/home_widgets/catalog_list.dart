import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sample/widgets/home_widgets/add_to_cart.dart';
import 'package:sample/widgets/home_widgets/catalog_image.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:sample/models/catalog.dart';
import 'package:sample/pages/home_details_page.dart';

// catalog list code
class CatalogList extends StatelessWidget {
  const CatalogList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: CatalogModel.items.length,
      itemBuilder: (context, index) {
        final catalog = CatalogModel.items[index];
        return InkWell(
            onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => HomeDetailPage(
                      catalog: catalog,
                    ),
                  ),
                ),
            child: CatalogItem(catalog: catalog));
      },
    );
  }
}

// CatalogItem Code
class CatalogItem extends StatelessWidget {
  final Item catalog;

  const CatalogItem({Key? key, required this.catalog})
      : assert(catalog != null),
        super(key: key);
  @override
  Widget build(BuildContext context) {
    return VxBox(
      child: Row(
        children: [
          Hero(
            tag: Key(catalog.id.toString()),
            child: CatalogImage(
              image: catalog.image,
            ).p0(),
          ),
          Expanded(
              child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              catalog.name.text.xl2.bold.color(context.theme.hintColor).make(),
              catalog.desc.text.xl.caption(context).gray500.make(),
              const HeightBox(20.0),
              ButtonBar(
                alignment: MainAxisAlignment.spaceEvenly,
                buttonPadding: const EdgeInsets.only(left: 10),
                children: [
                  "\$${catalog.price}".text.bold.xl2.orange500.make(),
                  AddToCart(catalog: catalog)
                ],
              )
            ],
          )),
        ],
      ),
    ).color(context.cardColor).roundedLg.square(180).make().py12();
  }
}
