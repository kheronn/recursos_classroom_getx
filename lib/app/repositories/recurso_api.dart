import 'dart:convert';

import 'package:course_app/app/model/recurso.dart';
import 'package:http/http.dart' as http;

class RecursoAPI {
  
  String url =
      "https://script.google.com/macros/s/AKfycbxGaLN-OmqmY_OebpM1nyuYPNdSAodlNeUjmB0EgEkJEAm22Zg/exec";

  Future<List<Recurso>> getRecursos() async {
    try {
   
      var response = await http.get(url);
      if (response.statusCode == 200) {
        var data = json.decode(response.body);
       // print(data);
        return List<Recurso>.from(
            data["recursos"].map((x) => Recurso.fromJson(x)));
      } else {
        return List<Recurso>();
      }
    } catch (error) {
      print(error);
      return List<Recurso>();
    }
  }
}
