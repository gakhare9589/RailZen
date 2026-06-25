import 'dart:convert';
import 'package:http/http.dart' as http;

class TrainSearchService {
  static const String _apiKey = 'YOUR_NEW_RAPIDAPI_KEY';

  Future<Map<String, dynamic>> searchTrain(String train) async {
    final url = Uri.parse(
      'https://indian-railway-irctc.p.rapidapi.com/api/trains-search/v1/train/$train?isH5=true&client=web',
    );

    final response = await http.get(
      url,
      headers: {
        'x-rapidapi-host': 'indian-railway-irctc.p.rapidapi.com',
        'x-rapidapi-key': _apiKey,
        'Content-Type': 'application/json',
        'x-rapidapi': 'rapid-api-database',
      },
    );

    print('Status: ${response.statusCode}');
    print('Body: ${response.body}');

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);

      if (data['body'] == null || (data['body'] as List).isEmpty) {
        throw Exception('No train found.');
      }

      return data;
    }

    throw Exception('API Error: ${response.statusCode}');
  }
}