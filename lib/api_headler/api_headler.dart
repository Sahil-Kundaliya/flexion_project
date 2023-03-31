import 'dart:convert';

import 'package:flexion_project/model_class/logo_data_model.dart';
import 'package:http/http.dart' as http;

class ApiHeadler {
  Future logoApiData() async {
    String logoApi = 'https://api.jikan.moe/v4/anime';

    http.Response data = await http.get(Uri.parse(logoApi));
    List<dynamic> value = json.decode(data.body)['data'];
    List response = [];
    for (int i = 0; i < value.length; i++) {
      response.add(LogoDataModel.fromJson(value[i]));
    }
    return response;
  }

  void Functio() {
    String hh = "sdasd";
  }
}
