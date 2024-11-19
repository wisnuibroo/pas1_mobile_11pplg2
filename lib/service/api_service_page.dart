import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:pas1_mobile_11pplg2_33/model/home_model.dart';


class ApiServicePage {
  final String baseUrl = 'https://www.thesportsdb.com';

  Future<List<HomeModel>> fetchCategory() async {
    final response =
        await http.get(Uri.parse('$baseUrl/api/v1/json/3/search_all_teams.php?l=English%20Premier%20League'));

    if (response.statusCode == 200) {
      Map<String, dynamic> jsonResponse = json.decode(response.body);
      List<dynamic> teamList = jsonResponse['teams'];

      return teamList
          .map((team) => HomeModel.fromJson(team))
          .toList();
    } else {
      throw Exception('Failed to load categories');
    }
  }

  fetchCatfetegories() {}
}
