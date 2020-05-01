import 'package:course_app/app/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'home_controller.dart';

class HomePage extends StatefulWidget {
  final String title;
  const HomePage({Key key, this.title = "Home"}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends ModularState<HomePage, HomeController> {
  //use 'controller' variable to access controller

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.only(left: 20, top: 50, right: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                SvgPicture.asset("assets/icons/menu.svg"),
                //     Image.asset("assets/images/user2.jpg"),
              ],
            ),
            SizedBox(height: 30),
            Text("Recursos Google", style: kHeadingextStyle),
            //    Text("Para Alunos e Professores", style: kSubheadingextStyle),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text("Categorias",
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.redAccent,
                      fontWeight: FontWeight.bold,
                    )),
              ],
            ),
            SizedBox(height: 20),
            Expanded(
              child: Observer(builder: (_) {
                return StaggeredGridView.countBuilder(
                  padding: EdgeInsets.all(1),
                  crossAxisCount: 2,
                  itemCount: controller.categories.length,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: () {
                        Modular.to.pushNamed('categoria/${controller.categories[index].name}');
                      },
                      child: Container(
                        padding: EdgeInsets.all(20),
                        height: index.isEven ? 200 : 240,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(16),
                          image: DecorationImage(
                            image:
                                AssetImage(controller.categories[index].image),
                            fit: BoxFit.contain,
                          ),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              controller.categories[index].name,
                              style: kTitleTextStyle,
                            ),
                            Text(
                              '${controller.categories[index].numOfCourses} recursos',
                              style: TextStyle(
                                color: kTextColor.withOpacity(.5),
                              ),
                            )
                          ],
                        ),
                      ),
                    );
                  },
                  staggeredTileBuilder: (index) => StaggeredTile.fit(1),
                );
              }),
            ),
          ],
        ),
      ),
    );
  }
}
