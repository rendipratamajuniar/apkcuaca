import 'dart:convert';

import 'package:apkcuaca/model/cuaca_model.dart';
import 'package:http/http.dart' as http;

class DataService {
  Future<CuacaModel> fetchData(String cityName) async {
    try {
      final queryParameters = {
        'q': cityName,
        'appid': '731ba12dceb0552781e829a05690f5ba',
        'units': 'metric'
      };
      final uri = Uri.https(
          'api.openweathermap.org', '/data/2.5/weather', queryParameters);
      final response = await http.get(uri);
      if (response.statusCode == 200) {
        return CuacaModel.fromJson(jsonDecode(response.body));
      } else {
        throw Exception('failed to load weather');
      }
    } catch (e) {
      rethrow;
    }
  }
}
