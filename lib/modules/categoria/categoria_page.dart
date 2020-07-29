import 'package:course_app/app/constants.dart';
import 'package:course_app/app/widgets/recurso_card.dart';
import 'package:course_app/models/recurso.dart';
import 'package:course_app/modules/home/home_controllerg.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CategoriaPage extends StatelessWidget {
  final HomeControllerG controller = Get.find();

  @override
  Widget build(BuildContext context) {
    //var size = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          //width: 50,
          decoration: BoxDecoration(
            color: Color(0xFFF5F4EF),
            image: DecorationImage(
              image: AssetImage("assets/images/playlist.png"),
              alignment: Alignment.topCenter,
            ),
          ),
          child: Column(
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(left: 20, top: 70, right: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    SizedBox(height: 90),
                    Text(controller.tipo.value.toUpperCase(),
                        style: kHeadingextStyle),
                    SizedBox(height: 10),
                    Obx(() {
                      if (controller.recursos == null ||
                          controller.recursos.length < 1) {
                        return Container();
                      } else {
                        return Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: <Widget>[
                            CircleAvatar(
                                child: Text(
                                    controller.recursos.length.toString())),
                            SizedBox(width: 2),
                            Text("recurso(s)", style: kSubtitleTextSyule),
                          ],
                        );
                      }
                    }),
                  ],
                ),
              ),
              Obx(() {
                List<Recurso> list = controller.recursos.value;
                if (list == null || list.isEmpty) {
                  return Center(child: CircularProgressIndicator());
                } else {
                  return _buildListRecursos(list);
                }
              }),
            ],
          ),
        ),
      ),
    );
  }

  ListView _buildListRecursos(List<Recurso> list) {
    return ListView.builder(
      physics: NeverScrollableScrollPhysics(),
      itemCount: list.length,
      shrinkWrap: true,
      itemBuilder: (_, index) {
        Recurso model = list[index];
        return RecursoCard(
            name: model.titulo,
            chapterNumber: (index + 1),
            tag: model.autoria,
            tipo: model.tipo,
            link: model.link);
      },
    );
  }
}
