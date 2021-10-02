import 'package:flutter/material.dart';
import 'package:sample/widgets/drawer.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  final int days = 30;
  final String name = "Muhammad";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "U Catalog App",
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: Center(
        child: Container(
          child: Text("Welcome to $days days of flutter $name"),
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
