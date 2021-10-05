import 'package:flutter/material.dart';
import 'package:sample/core/store.dart';
import 'package:sample/models/cart.dart';
import 'package:velocity_x/velocity_x.dart';

class CartPage extends StatelessWidget {
  const CartPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.canvasColor,
      appBar: AppBar(
        backgroundColor: context.theme.hintColor,
        iconTheme: IconThemeData(color: context.theme.cardColor),
        title: "U Cart".text.make(),
      ),
      body: Column(
        children: [
          _cartList().p32().expand(),
          const Divider(),
          const _CartTotal(),
        ],
      ),
    );
  }
}

class _CartTotal extends StatelessWidget {
  const _CartTotal({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final CartModel _cart = (VxState.store as MyStore).cart;
    return SizedBox(
      height: 200,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          ElevatedButton(
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                  content:
                      "BuYing not Avaliable at the moment Yet".text.make()));
            },
            style: ButtonStyle(
                backgroundColor:
                    MaterialStateProperty.all(context.theme.hintColor)),
            child: "BUY"
                .text
                .xl3
                .bold
                .color(context.theme.bottomAppBarColor)
                .make(),
          ).wh8(context).w20(context),
          10.widthBox,
          VxBuilder(
              mutations: const {RemoveMutation},
              builder: (context, _, status) {
                return "Total:\$${_cart.totalPrice}".text.xl4.orange500.make();
              }),
        ],
      ),
    );
  }
}

class _cartList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    VxState.watch(context, on: [RemoveMutation]);
    final CartModel _cart = (VxState.store as MyStore).cart;
    return _cart.items.isEmpty
        ? "Noting to show.".text.orange600.xl3.underline.makeCentered()
        : ListView.builder(
            itemCount: _cart.items.length,
            itemBuilder: (context, index) => ListTile(
              title: _cart.items[index].name.text.xl2.orange500.make(),
              leading:
                  const Icon(Icons.done_all_outlined).iconColor(Colors.green),
              trailing: IconButton(
                icon: const Icon(Icons.remove_circle_outline_rounded)
                    .iconColor(Colors.red),
                onPressed: () => RemoveMutation(item: _cart.items[index]),
              ),
            ),
          );
  }
}
