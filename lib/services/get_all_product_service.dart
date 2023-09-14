// import '../helper/api.dart';

// class AllProductService {
//   Future<List<ProductModel>> getAllProdcuts() async {
//     List<dynamic> data =
//         await Api().get(url: 'https://fakestoreapi.com/products');
//     //response.statusCode;
//     //statuscode
//     //200 - 299 success
//     //400 = 499 error from u not server
//     //500 - 599 error from server

//     List<ProductModel> productsList = [];

//     for (int i = 0; i < data.length; i++) {
//       productsList.add(
//         ProductModel.fromJson(data[i]),
//       );
//     }
//     return productsList;
//   }
// }
