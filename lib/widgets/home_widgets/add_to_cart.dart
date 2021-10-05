import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sample/models/cart.dart';
import 'package:sample/models/catalog.dart';
import 'package:velocity_x/velocity_x.dart';

class AddToCart extends StatelessWidget {
  final Item catalog;
  AddToCart({Key? key, required this.catalog}) : super(key: key);
  final _cart = CartModel();
  @override
  Widget build(BuildContext context) {
    bool isinCart;
    if (_cart.items.contains(catalog)) {
      isinCart = _cart.items.contains(catalog);
    } else {
      isinCart = false;
    }
    return ElevatedButton(
      onPressed: () {
        if (!isinCart) {
          isinCart = isinCart.toggle();
          final _catalog = CatalogModel();
          _cart.catalog = _catalog;
          _cart.add(catalog);
          // setState(() {});
        } else {
          showDialog<String>(
            context: context,
            builder: (BuildContext context) => AlertDialog(
              title: const Text('Alert').centered().backgroundColor(Colors.red),
              content: const Text('Item Already Added'),
              actions: <Widget>[
                TextButton(
                  onPressed: () => Navigator.pop(context, 'Cancel'),
                  child: const Text('Cancel'),
                ),
                TextButton(
                  onPressed: () => Navigator.pop(context, 'OK'),
                  child: const Text('OK'),
                ),
              ],
            ),
          );
        }
      },
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(context.theme.hintColor),
      ),
      child: isinCart
          ? const Icon(Icons.done_outlined)
          : const Icon(CupertinoIcons.cart_badge_plus),
    );
  }
}
