import 'dart:convert';
import 'package:http/http.dart' as http;

class PnrService {
  Future<Map<String, dynamic>> checkPnr(String pnr) async {
    final response = await http.get(

      Uri.parse(
        'https://irctc-indian-railway-pnr-status.p.rapidapi.com/getPNRStatus/$pnr',
      ),
      headers: {
        'x-rapidapi-host':
        'irctc-indian-railway-pnr-status.p.rapidapi.com',


        'x-rapidapi-key': '4db579ae88msh6530f6300f8760fp16fbe8jsn29a056e248fa',
      },
    );
    print("Status Code: ${response.statusCode}");
    print("Response: ${response.body}");
    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw Exception('Failed to load PNR');
    }
  }
}