import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  startTimeout() async {
    return Timer(Duration(seconds: 6), changeScreen);
  }

  changeScreen() async {
    Modular.to.pushReplacementNamed('/home');
  }

  @override
  void initState() {
    super.initState();
    // SystemChrome.setEnabledSystemUIOverlays([]);
    startTimeout();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: const FractionalOffset(0.5, 0.0),
              end: const FractionalOffset(0.0, 0.5),
              stops: [0.0, 1.0],
              tileMode: TileMode.clamp,
              colors: [Colors.white54, Colors.lightBlue.shade100]),
        ),
        margin: EdgeInsets.only(left: 4.0, right: 4.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              SizedBox(width: 2.0),
              /*     Container(
                width: 400,
                height: 400,
                child: FlareActor("assets/images/work.flr",
                    animation: "animation", fit: BoxFit.contain),
              ), */
              Container(
                alignment: Alignment.center,
                width: 50,
                child: SvgPicture.asset(
                  "assets/images/recursos.svg",
                  fit: BoxFit.contain,
                  width: 250,
                ),
              ),
              Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Container(
                      height: 65,
                      width: 65,
                      child: CircularProgressIndicator(),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 24.0),
                      child: Text(
                        'RECURSOS GOOGLE PARA EDUCADORES E ALUNOS',
                        textAlign: TextAlign.center,
                        style: GoogleFonts.lato(
                            color: Colors.black87,
                            fontSize: 20,
                            
                            fontWeight: FontWeight.w700),
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
