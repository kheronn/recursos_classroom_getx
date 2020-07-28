import 'package:course_app/app/modules/categoria/categoria_page.dart';
import 'package:course_app/app/modules/home/home_bind.dart';
import 'package:course_app/app/modules/home/home_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'app/modules/categoria/categoria_bind.dart';

void main() => runApp(GetMaterialApp(
      initialRoute: '/home',
      defaultTransition: Transition.native,
      locale: Locale('pt', 'BR'),
      getPages: [
        GetPage(
          name: '/home',
          page: () => HomePage(),
          binding: HomeBind(),
        ),
        GetPage(
            name: '/categoria/:tipo',
            page: () => CategoriaPage(),
            binding: CategoriaBind())
      ],
    ));
