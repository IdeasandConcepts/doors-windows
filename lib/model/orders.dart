
import 'dart:convert';

import 'package:doorsandwindows/model/client.dart';
import 'package:doorsandwindows/model/products.dart';
import 'package:flutter/foundation.dart';

class Orders {


  final List<Products> products;
  final Clients client;
  final String employeeName;
  final String status;


  Orders(  {
    required this.status,
    required this.products,
    required this.client,
    required this.employeeName
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'status':status,
      'client': client,
      'products': products.map((x) => x.toMap()).toList(),
      'employee_name': employeeName,


    };
  }

  factory Orders.fromMap(Map<String, dynamic> map) {
    return Orders(
      status: map['status'],
      client: map['client'] ?? '',
      employeeName: map['employee_name'] as String,
      products: List<Products>.from(
        (map['products'] as List).map<Products>(
              (x) => Products.fromMap(x as Map<String, dynamic>),
        ),
      ),
    );
  }

  Orders copyWith({
    String? status,
    String? employeeName,
    List<Products>? product,
    Clients? client,

  }) {
    return Orders(
      status: status ?? this.status,
        client: client ?? this.client,
        employeeName: employeeName ?? this.employeeName,
        products: products??

            this.products
      //deliveryMethod: deliveryMethod ?? this.deliveryMethod,
    );
  }

  String toJson() => json.encode(toMap());

  factory Orders.fromJson(String source) =>
      Orders.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Orders(employee_name: $employeeName,status:$status client: $client, products: $products)';
  }

  @override
  bool operator ==(covariant Orders other) {
    if (identical(this, other)) return true;

    return other.employeeName == employeeName &&
        other.client == client &&
        other.status == status &&
        listEquals(other.products, products) ;
  }

  @override
  int get hashCode {
    return employeeName.hashCode ^
    status.hashCode ^
    client.hashCode ^
    products.hashCode ;

  }
}

// List <Orders> userOrders =[];
//
// void adduserOrder(
//     {
//       required List<UserRequests> requests,
//       required String oUser,
//       required String email,
//       required int phone,
//       required String uAddress,
//       required DateTime uDate,
//       required DateTime uTime,
//      // required int uTotalRequests,
//       required double uTotalPrice,
//       required double lat,
//       required  double lan,
//       required String deliveryMethod,
//
//     })
// {
//   final newDetails= Orders(
//     deliveryMethod: deliveryMethod,
//     requests:requests,
//     oUser: oUser,
// // email:email,
//   phone: phone,
//   uAddress:   uAddress,
//  uDate:  uDate,
//    uTime:  uTime,
//  // uTotalRequests: uTotalRequests,
//     uTotalPrice:uTotalPrice,
//     lan: lan,
//     lat: lat,
//
//
//   );
//
//    userOrders.add(newDetails);
//}