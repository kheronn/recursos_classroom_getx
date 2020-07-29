import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'modules/categoria/categoria_bind.dart';
import 'modules/categoria/categoria_page.dart';
import 'modules/home/home_bind.dart';
import 'modules/home/home_page.dart';
import 'modules/home/splash_page.dart';

void main() => runApp(GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      defaultTransition: Transition.native,
      locale: Locale('pt', 'BR'),
      getPages: [
        GetPage(
          name: "/",
          page: () => SplashPage(),
        ),
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
