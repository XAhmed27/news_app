import 'package:flutter/material.dart';
import 'package:news_app/view/tab/news_tab/news_tab.dart';

class Home extends StatefulWidget {
  static String routename = 'Home';
  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("News"),
        centerTitle: true,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(12),
                bottomRight: Radius.circular(12))),
      ),
      body: NewsTab(),
    );
  }
}
