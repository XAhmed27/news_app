import 'package:flutter/material.dart';
import 'package:news_app/data/api/api_manger.dart';
import 'package:news_app/data/model/SourcesResponseDm.dart';

class NewsTab extends StatefulWidget {
  @override
  State<NewsTab> createState() => _NewsTabState();
}

class _NewsTabState extends State<NewsTab> {
  int currentIndex = 0;
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
            return Center(child: CircularProgressIndicator());
          }
        });
  }

  Widget getscreen(List<Sources> sources) {
    return DefaultTabController(
        length: sources.length,
        child: Column(
          children: [
            SizedBox(
              height: 12,
            ),
            TabBar(
              tabs: sources.map((source) {
                return getTab(source, currentIndex == sources.indexOf(source));
              }).toList(),
              onTap: (index) {
                currentIndex = index;
                setState(() {});
              },
              isScrollable: true,
              indicatorColor: Colors.transparent,
            ),
            Expanded(
              child: TabBarView(
                children: sources.map((source) {
                  return Text(source.name ?? "unknown");
                }).toList(),
              ),
            )
          ],
        ));
  }

  Widget getTab(Sources source, bool isSelected) {
    return Container(
      padding: EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: isSelected == true ? Colors.indigoAccent : Colors.white,
        borderRadius: BorderRadius.circular(6),
      ),
      child: Text(source.name ?? "unkown",
          style: TextStyle(
              color: isSelected == true ? Colors.white : Colors.indigoAccent)),
    );
  }
}
