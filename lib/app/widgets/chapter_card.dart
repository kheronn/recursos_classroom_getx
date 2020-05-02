import 'package:flutter/material.dart';
import 'package:share/share.dart';
import 'package:url_launcher/url_launcher.dart';

class ChapterCard extends StatelessWidget {
  final String name;
  final String tag;
  final String link;
  final String tipo;
  final int chapterNumber;
  final Function press;
  const ChapterCard({
    Key key,
    this.name,
    this.tag,
    this.chapterNumber,
    this.link,
    this.tipo,
    this.press,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Container(
      padding: EdgeInsets.only(top: 5, bottom: 10, ),
      margin: EdgeInsets.only(bottom: 5, top:5, left: 5, right: 5),
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
        contentPadding: EdgeInsets.all(8),
        title: Text(
          name,
          overflow: TextOverflow.visible,
          style: TextStyle(fontSize: 16),
        ),
        subtitle: Text(tag, style: TextStyle(fontWeight: FontWeight.bold)),
        trailing: GestureDetector(
          onTap: () async {
            Share.share('$link', subject: '$name');
          },
          child: Container(
            margin: EdgeInsets.only(left: 10),
            height: 40,
            width: 40,
            decoration:
                BoxDecoration(shape: BoxShape.circle, color: Colors.green),
            child: Icon(Icons.share, color: Colors.white),
          ),
        ),
        leading: GestureDetector(
          onTap: () async {
            if (await canLaunch(link)) {
              await launch(link);
            } else {
              throw 'Não é possivel $link';
            }
          },
          child: Container(
            margin: EdgeInsets.only(left: 10),
            height: 40,
            width: 40,
            decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: (tipo == "video") ? Colors.red : Colors.green),
            child: Icon(
                (tipo == "video") ? Icons.play_arrow : Icons.picture_as_pdf,
                color: Colors.white),
          ),
        ),
      ),
    );
  }
}
