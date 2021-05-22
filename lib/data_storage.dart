import 'package:covid19/models/deaths_model.dart';
import 'package:covid19/models/newsModel.dart';
import 'package:http/http.dart';
import 'package:intl/intl.dart';
import 'dart:convert';

import 'models/countryModel.dart';

class DataStorage {
  Future<DeathsModel> getDeaths(String country) async {
    var now = new DateTime.now();
    var formatter = new DateFormat('yyyy-MM-dd');
    String formattedDate = formatter.format(now);
    try {
      final url = Uri.parse(
          'https://api.covid19tracking.narrativa.com/api/$formattedDate/country/$country');
      Response response = await get(url);
      int statusCode = response.statusCode;
      Map<String, String> headers = response.headers;
      String contentType = headers['content-type'];
      String json = response.body;
      Map<String, dynamic> body = jsonDecode(json);
      Map<String, dynamic> dateData = body["dates"]["$formattedDate"];
      Map<String, dynamic> countryData = dateData["countries"]["$country"];
      DeathsModel deathsData = new DeathsModel();
      deathsData.totalCases = countryData["today_confirmed"];
      deathsData.totalDeaths = countryData["today_deaths"];

      return deathsData;
    } catch (e) {
      print(e);
    }
  }

  Future<List<dynamic>> getCountryNews(String code) async {
    try {
      final url = Uri.parse(
          'https://newsapi.org/v2/top-headlines?country=$code&category=health&apiKey=c0bd0fb9882d43df8e9aec9a2eab26fd');
      Response response = await get(url);
      int statusCode = response.statusCode;
      Map<String, String> headers = response.headers;
      String contentType = headers['content-type'];
      String json = response.body;
      Map<String, dynamic> body = jsonDecode(json);
      List<dynamic> news = body["articles"];
      return news;
    } catch (e) {
      print(e);
    }
  }

  Future<List<Countries>> getAllCountries() async {
    try {
      final url = Uri.parse('https://restcountries.eu/rest/v2/all');
      Response response = await get(url);
      int statusCode = response.statusCode;
      Map<String, String> headers = response.headers;
      String contentType = headers['content-type'];
      String json = response.body;
      List<dynamic> body = jsonDecode(json);
      List<Countries> countries =
          body.map((dynamic country) => Countries.fromJson(country)).toList();
      print(countries);
      return countries;
    } catch (e) {
      print(e);
    }
  }
}
