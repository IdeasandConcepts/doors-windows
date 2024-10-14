//
// import 'dart:convert';
// import 'package:doorsandwindows/model/orders.dart';
// import 'package:http/http.dart' as http;
// const url="https://www.test.com";
//
// Orders? order;
// List<Orders> orders=[];
// Map<String,dynamic>? dataMap;
// Map<String,dynamic>? doneDataMap;
// List<dynamic>? data;
//
// Future readOrders () async {
//   http.Response response ;
//   response= await http.get(Uri.parse(url));
//
//   if(response.statusCode==200)
//   {
//     dataMap=jsonDecode(response.body);
//     doneDataMap=dataMap!['data']; /// for single data
//
//     order=Orders(
//
//       lang: doneDataMap!['langitute'],
//       lat: doneDataMap!['latitute'],
//       name: doneDataMap!["name"],
//       address:doneDataMap!["address"],
//       phoneNumber: doneDataMap!['phone_number'],
//       email: doneDataMap!['email'],
//       profileImage: doneDataMap!['profile_image'],
//     );
//     data =dataMap!['data']; /// for list of data
//     for(int x=0;x<data!.length;x++)
//       orders[x]=Orders(
//         lang: data![x]['langitute'],
//         lat:data![x]['latitute'],
//         name:data![x]["name"],
//         address:data![x]["address"],
//         phoneNumber:data![x]['phone_number'],
//         email:data![x]['email'],
//         profileImage:data![x]['profile_image'],
//       );
//   }
// }
