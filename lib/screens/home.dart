import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({super.key, required this.name});

  final String name;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Text("Hello $name"),
      ),
    );
  }
}
