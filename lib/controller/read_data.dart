// import 'dart:convert';
//
// import 'package:doorsandwindows/model/products.dart';
// import 'package:http/http.dart' as http;
// const url="https://www.test.com";
//
// Products? product;
// List<Products> products=[];
// Map<String,dynamic>? dataMap;
// Map<String,dynamic>? doneDataMap;
// List<dynamic>? data;
//
// Future readProducts () async {
//   http.Response response ;
//   response= await http.get(Uri.parse(url));
//
// if(response.statusCode==200)
//   {
//     dataMap=jsonDecode(response.body);
//     doneDataMap=dataMap!['data'];/// for single data
//
//   product=Products(
//       pCode: doneDataMap!['productCode'],
//       pTitle:doneDataMap!['productName'],
//       pColor: doneDataMap!['productColor'],
//       classColor: doneDataMap!['classColor'],
//       pCategory: doneDataMap!['category'],
//       pHeight: doneDataMap!['height'],
//       pWidth:doneDataMap!['width'],
//   );
//     data =dataMap!['data']; /// for list of data
//     for(int x=0;x<data!.length;x++)
//     products[x]=Products(
//       pCode: data![x]['productCode'],
//       pTitle:data![x]['productName'],
//       pColor: data![x]['productColor'],
//       classColor: data![x]['classColor'],
//       pCategory: data![x]['category'],
//       pHeight: data![x]['height'],
//       pWidth:data![x]['width'],
//     );
//   }
// }
