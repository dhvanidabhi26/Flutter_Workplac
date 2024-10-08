import 'dart:convert';

import 'package:http/http.dart';

import 'package:http/http.dart' as http;

class ApiService {
  Future<List<Map<String, dynamic>>?> getPhotos() async {
    try {
      Response response = await http
          .get(Uri.parse('https://jsonplaceholder.typicode.com/posts'));
      if (response.statusCode == 200) {
        print("response 200");
        print(response.body);
        final data = jsonDecode(response.body) as List<dynamic>;
        return data.cast<Map<String, dynamic>>();
      } else {
        return null;
      }
    } catch (e) {
      print("error = $e");
    }
  }
}

// import 'dart:convert';
//
// import 'package:http/http.dart';
//
// import 'package:http/http.dart' as http;
//
// class ApiService {
//
//   Future<void> getPhotos (String email)async{
//     try{
//       Response response = await http.post(Uri.parse('https://jsonplaceholder.typicode.com/posts'),
//      ) ;
//       if(response.statusCode == 200){
//         print("response 200");
//         print(response.body);
//         final data = jsonDecode(response.body) as List<dynamic>;
//         return data.cast<Map<String, dynamic>>();
//       }else {
//         return null ;
//       }
//     }catch(e){
//       print("error = $e");
//     }
//   }
// }
//
//
