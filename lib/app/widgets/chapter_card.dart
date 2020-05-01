import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class ChapterCard extends StatelessWidget {
  final String name;
  final String tag;
  final String link;
  final int chapterNumber;
  final Function press;
  const ChapterCard({
    Key key,
    this.name,
    this.tag,
    this.chapterNumber,
    this.link,
    this.press,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Container(
      padding: EdgeInsets.symmetric(vertical: 10, horizontal: 2),
      margin: EdgeInsets.only(bottom: 10, top: 10),
      width: size.width - 8,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(38.5),
        boxShadow: [
          BoxShadow(
            offset: Offset(0, 10),
            blurRadius: 33,
            color: Color(0xFFD3D3D3).withOpacity(.84),
          ),
        ],
      ),
      child: ListTile(
        onTap: () async {
          if (await canLaunch(link)) {
            await launch(link);
          } else {
            throw 'Não é possivel $link';
          }
        },
        title: Text(
          name,
          overflow: TextOverflow.ellipsis,
          style: TextStyle(fontSize: 14),
        ),
        subtitle: Text(tag),
        trailing: Container(
          margin: EdgeInsets.only(left: 10),
          height: 30,
          width: 30,
          decoration:
              BoxDecoration(shape: BoxShape.circle, color: Colors.green),
          child: Icon(Icons.play_arrow, color: Colors.white),
        ),
      ),
    );
  }
}
