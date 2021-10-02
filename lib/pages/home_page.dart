import 'package:flutter/material.dart';
import 'package:sample/models/catalog.dart';
import 'package:sample/widgets/drawer.dart';
import 'package:sample/widgets/item_widget.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  final int days = 30;
  final String name = "Muhammad";

  @override
  Widget build(BuildContext context) {
    final dummylist = List.generate(50, (index) => CatalogModel.items[0]);
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "U Catalog App",
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView.builder(
          itemCount: dummylist.length,
          itemBuilder: (context, index) {
            return ItemWidget(
              item: dummylist[index],
            );
          },
        ),
      ),
      drawer: const MyDrawer(),
      // floatingActionButton: Theme(
      //     data: Theme.of(context).copyWith(splashColor: Colors.yellow),
      //     child: FloatingActionButton(
      //       onPressed: () {},
      //       child: const Icon(Icons.add),
      //     )),
    );
  }
}
