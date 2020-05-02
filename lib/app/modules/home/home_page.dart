import 'package:course_app/app/constants.dart';
import 'package:course_app/app/model/recurso.dart';
import 'package:course_app/app/widgets/chapter_card.dart';
import 'package:flappy_search_bar/flappy_search_bar.dart';
import 'package:flappy_search_bar/search_bar_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'home_controller.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

class HomePage extends StatefulWidget {
  final String title;
  const HomePage({Key key, this.title = "Home"}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends ModularState<HomePage, HomeController> {
  //use 'controller' variable to access controller
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      drawerEdgeDragWidth: 0,
      appBar: AppBar(
        title: Text("Recursos Google",
            style: TextStyle(
              fontSize: 26,
              color: Colors.white,
              fontWeight: FontWeight.bold,
            )),
        backgroundColor: Colors.red.shade300,
        actions: [
          IconButton(
            icon: Icon(Icons.menu),
            onPressed: () {
              _scaffoldKey.currentState.openDrawer();
            },
          )
        ],
        automaticallyImplyLeading: false,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: SizedBox(
        width: 70.0,
        height: 70.0,
        child: FloatingActionButton(
          child: Icon(
            Icons.search,
            size: 50,
          ),
          elevation: 5,
          backgroundColor: Colors.yellow.shade900,
          onPressed: () {
            showCupertinoModalBottomSheet(
                context: context,
                builder: (context, scrollController) {
                  return Material(
                    child: Container(
                      child: SearchBar<Recurso>(
                        searchBarStyle: SearchBarStyle(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        searchBarPadding: EdgeInsets.symmetric(horizontal: 5),
                        headerPadding: EdgeInsets.symmetric(horizontal: 1),
                        listPadding: EdgeInsets.symmetric(horizontal: 5),
                        loader: Center(child: CircularProgressIndicator()),
                        emptyWidget: Text('Nenhum resultado'),
                        hintText: "O que você está procurando?",
                        shrinkWrap: false,
                        cancellationWidget: Text("Cancelar"),
                        onItemFound: (Recurso model, int index) {
                          return ChapterCard(
                              name: model.titulo,
                              chapterNumber: (index + 1),
                              tag: model.autoria,
                              tipo: model.tipo,
                              link: model.link);
                        },
                        onSearch: (String text) async {
                          return controller.search(text);
                        },
                      ),
                    ),
                  );
                });
          },
        ),
      ),
      drawer: UserAccountsDrawerHeader(
        accountName: Text('Kheronn Khennedy Machado'),
        accountEmail: Text('CRTE - Wenceslau Braz'),
        currentAccountPicture: CircleAvatar(
          child: Image.asset("assets/images/user2.jpg"),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.only(left: 20, top: 5, right: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            SizedBox(height: 15),
            Expanded(
              child: Observer(builder: (_) {
                List<Recurso> list = controller.recursos;
                if (list == null || list.isEmpty) {
                  return Center(child: CircularProgressIndicator());
                } else {
                  return StaggeredGridView.countBuilder(
                    padding: EdgeInsets.all(1),
                    crossAxisCount: 2,
                    itemCount: controller.categories.length,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10,
                    itemBuilder: (context, index) {
                      return InkWell(
                        onTap: () {
                          Modular.to.pushNamed(
                              'categoria/${controller.categories[index].name}');
                        },
                        child: Container(
                          padding: EdgeInsets.all(20),
                          height: index.isEven ? 200 : 240,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(16),
                            image: DecorationImage(
                              image: AssetImage(
                                  controller.categories[index].image),
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
                }
              }),
            ),
          ],
        ),
      ),
    );
  }
}
