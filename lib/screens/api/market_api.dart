import 'dart:convert';

import 'package:myapp/screens/model/products_model.dart';

import 'package:http/http.dart' as http;

class FeaturesApi{
  
  static Future<List<ProductsModel>> fetchMarketNews() async {
    final url =
        'https://h3ques1ic9vt6z4rp-1.a1.typesense.net/collections/market_news_collection/documents/search?q=*&per_page=10';
    final uri = Uri.parse(url);

    final response = await http.get(uri, headers: {
      'Content-Type': 'application/json',
      'X-TYPESENSE-API-KEY': 'NHAYhtkThbpAtxpBemD4AKPc9loguxqT',
    });

    if (response.statusCode == 200) {
      final body = response.body;
      print(body);
      final json = jsonDecode(body);
      final results = json['hits'] as List<dynamic>;

      final marketNews = results.map((e) {
        return ProductsModel.fromJson(e);
      }).toList();

      return marketNews;
    } else {
      throw Exception('Failed to load market news');
    }
  }
}