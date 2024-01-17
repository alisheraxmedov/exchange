import 'dart:convert';

import 'package:exchange/model/model.dart';
import 'package:http/http.dart' as http;

Future<List<Currensy>> getCurrensy() async {
  final response = await http.get(
    Uri.parse(
      "https://v6.exchangerate-api.com/v6/23f036799251d773ea957d2f/latest/USD",
    ),
  );
  if (response.statusCode == 200) {
    List<Map<String, dynamic>> mapToList = [];

    mapToList.add(jsonDecode(response.body));

    List<Currensy> currency = [];

    Map<String, dynamic> body = {"result": mapToList};

    for (int i = 0; i < body["result"].length; i++) {
      currency.add(Currensy.fromJson(body["result"][i]));
    }

    return currency;
  } else {
    throw (Exception("Status code = ${response.statusCode}"));
  }
}
