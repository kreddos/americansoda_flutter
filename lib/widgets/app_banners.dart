import 'package:flutter/material.dart';
import 'package:americansoda/models/models.dart' as models;
import 'package:url_launcher/url_launcher.dart';

class AppBanners extends StatelessWidget {
  final List<models.Banner> data;

  AppBanners({Key key, this.data}) : super(key: key);

  onTap(models.Banner banner) async {
    if (await canLaunch(banner.url)) {
      await launch(banner.url);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: data.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: EdgeInsets.all(5),
            child: GestureDetector(
              onTap: () {
                onTap(data[index]);
              },
              child: ClipRRect(
                borderRadius: BorderRadius.all(Radius.circular(10)),
                child: Image.network(data[index].image),
              ),
            ),
          );
        },
      ),
    );
  }
}
