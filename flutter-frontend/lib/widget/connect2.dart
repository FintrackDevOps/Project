import 'dart:convert';
import 'dart:async';
import 'package:http/http.dart' as http;
import 'package:mipx/widget/connect.dart';

class Client {
  static Future getEm() {
    return http.get(Uri.parse("http://localhost:8000/transactions"));
  }
}


// class Client {
//   static final baseURL = "http://localhost:8000";
//   static final transactions = baseURL + "/transactions";

//   Future<Invest> fetchPost(int post) async {
//     final url = Uri.parse(transactions + "/$post");
//     final response = await http.get(url);

//     if (response.statusCode == 200) {
//       return Invest.fromJson(jsonDecode(response.body));

//     } else {
//       throw Exception('Unable to load: $post');
//     }
//   }
// }
