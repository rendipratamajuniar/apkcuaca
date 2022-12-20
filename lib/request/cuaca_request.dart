import 'dart:convert';
import 'package:apkcuaca/model/cuaca_model.dart';
import 'package:http/http.dart' as http;

class CuacaRequest {
  Future<CuacaModel> getCurrentWeather() async {
    var response = await http.get(Uri.parse(
        "https://api.openweathermap.org/data/2.5/weather?q=pamulang&appid=b5bedb63d4f648d38784f1b284518479&units=metric"));
    print(response.body);
    return CuacaModel.fromJson(jsonDecode(response.body));
  }
}