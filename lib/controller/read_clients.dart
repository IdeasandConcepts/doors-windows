//
// import 'dart:convert';
// import 'package:doorsandwindows/model/client.dart';
// import 'package:http/http.dart' as http;
// const url="https://www.test.com";
//
// Clients? client;
// List<Clients> clients=[];
// Map<String,dynamic>? dataMap;
// Map<String,dynamic>? doneDataMap;
// List<dynamic>? data;
//
// Future readClients () async {
//   http.Response response ;
//   response= await http.get(Uri.parse(url));
//
//   if(response.statusCode==200)
//   {
//     dataMap=jsonDecode(response.body);
//     doneDataMap=dataMap!['data']; /// for single data
//
//     client=Clients(
//       employeeId:doneDataMap!['employee_id'],
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
//       clients[x]=Clients(
//         employeeId:doneDataMap!['employee_id'],
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
