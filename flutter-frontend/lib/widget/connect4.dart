import 'package:http/http.dart' as http;

// void deleteInv(String id) async {
//   final http.Response response = await http.delete(
//     Uri.parse('http://localhost:8000//transactions/$id'),
//     headers: <String, String>{
//       'Content-Type': 'application/json; charset=UTF-8',
//     },
//   );
// }

class ClientDel {
  static Future getDelete(String id) {
    return http.delete(Uri.parse("http://localhost:8000/transactions/$id"));
  }
}
