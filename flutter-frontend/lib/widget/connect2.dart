import 'dart:convert';
import 'dart:async';
import 'package:http/http.dart' as http;
import 'package:mipx/widget/connect.dart';

class Client {
  static Future getEm() {
    return http.get(Uri.parse("http://localhost:8000/transactions"));
  }
}
