import 'dart:convert';
import 'dart:async';
import 'package:http/http.dart' as http;
import 'package:mipx/widget/connect.dart';

Future<http.Response> makeInvest(Invest adding) {
  return http.post(
    Uri.parse('http://localhost:8000/transactions/'),
    headers: {
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode({
      'description': adding.description,
      'buy_value': adding.buyvalue,
      'amount': adding.amount,
      'stock_abreviation': adding.stockabreviation
    }),
  );
}
