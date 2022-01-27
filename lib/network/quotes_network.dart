import 'dart:convert';

import '../model/quote.dart';
import 'package:http/http.dart' as http;

Future<Quote> fetchQuote() async {
  final response = await http.get(Uri.parse('https://favqs.com/api/qotd'));
  if (response.statusCode == 200) {
    return Quote.fromJson(json.decode(response.body));
  } else {
    throw Exception('Failed to load Quote');
  }
}