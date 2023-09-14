// import 'dart:convert';

// import 'package:tharwat/models/product_model.dart';
// import 'package:http/http.dart' as http;

// class CategoryService {
//   Future<List<ProductModel>> getCategory({required String categoryName}) async {
//     http.Response response = await http.get(
//         Uri.parse('https://fakestoreapi.com/products/category/$categoryName'));
//     if (response.statusCode == 200) {
//       List<dynamic> data = jsonDecode(response.body);
//       List<ProductModel> categoryList = [];
//       for (int i = 0; i < data.length; i++) {
//         categoryList.add(
//           ProductModel.fromJson(data[i]),
//         );
//       }
//       return categoryList;
//     } else {
//       throw Exception(
//           'there is a problem with status code ${response.statusCode}');
//     }
//   }
// }
