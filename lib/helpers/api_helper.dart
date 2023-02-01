import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:untitled/models/chepter.dart';

class APIHelper {
  APIHelper._();
  static final APIHelper apiHelper = APIHelper._();

  Future<List<Chapters>?> fetchChepters() async {
    String baseUrl = "https://bhagavadgitaapi.in";
    String endpoint = "/chapters";

    String api = baseUrl + endpoint;

    http.Response res  = await http.get(Uri.parse(api));

    if(res.statusCode == 200) {
      List decodedData = jsonDecode(res.body);

      List<Chapters> allChapters = decodedData.map((e) => Chapters.fromJson(json: e)).toList();

      return allChapters;
    }
    else {
      return null;
    }
  }
}