import 'dart:convert';
import 'package:api_class/model/people_model.dart';
import 'package:http/http.dart' as http;



class UserServices {
  String _baseUrl = "https://randomuser.me/api/";

  /// AI made Model Class & used it's fromJson function
  Future<PeopleModel?> fetchPeopleData(int numberOfUser) async {
    try {
      final url = "${_baseUrl}?results=${numberOfUser}";
      final response = await http.get(Uri.parse(url));
      // See in the console and Debug the response
      print("API Response: ${response.body}");
      final data = jsonDecode(response.body);
      if (response.statusCode == 200) {
        return PeopleModel.fromJson(data);
      } else {
        print("Failed to load data");
        return null;
      }
    } catch (e) {
      print("Error: $e");
      return null;
    }
  }
}
