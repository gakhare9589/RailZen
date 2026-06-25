import 'dart:convert';
import 'package:http/http.dart' as http;

class LiveTrainService {
  Future<Map<String, dynamic>> getTrainStatus(
      String trainNumber) async {

    final today = DateTime.now()
        .toString()
        .split(' ')[0]
        .replaceAll('-', '');

    final url = Uri.parse(
      'https://indian-railway-irctc.p.rapidapi.com/api/trains/v1/train/status'
          '?departure_date=$today'
          '&isH5=true'
          '&client=web'
          '&deviceIdentifier=Mozilla%20Firefox-138.0.0.0'
          '&train_number=$trainNumber',
    );

    final response = await http.get(
      url,
      headers: {
        'x-rapidapi-host':
        'indian-railway-irctc.p.rapidapi.com',
        'x-rapidapi-key':
        '4db579ae88msh6530f6300f8760fp16fbe8jsn29a056e248fa',
        'Content-Type': 'application/json',
        'x-rapidapi': 'rapid-api-database',
      },
    );

    print("Status Code: ${response.statusCode}");
    print("Response Body: ${response.body}");

    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    }

    throw Exception(
      'Failed to fetch train status. Status Code: ${response.statusCode}',
    );
  }
}