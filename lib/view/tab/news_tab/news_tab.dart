import 'package:flutter/material.dart';
import 'package:news_app/data/api/api_manger.dart';
import 'package:news_app/data/model/SourcesResponseDm.dart';

class NewsTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<SourcesResponseDm>(
        future: ApiManger.getSources(),
        builder: (context, snapShot) {
          if (snapShot.hasError) {
            return Text(snapShot.hasError.toString());
          } else if (snapShot.hasData) {
            return getscreen(snapShot.data!.sources!);
          } else {
            return CircularProgressIndicator();
          }
        });
  }

  Widget getscreen(List<Sources> sources) {
    return Scaffold();
  }
}
