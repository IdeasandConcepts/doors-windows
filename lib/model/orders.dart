// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:doorsandwindows/model/client.dart';
import 'package:doorsandwindows/model/products.dart';
import 'package:doorsandwindows/model/request.dart';
import 'package:flutter/foundation.dart';

class Orders {


  final List<Products> product;
  final Clients client;
  final String employeeName;


  Orders( {
    required this.product,
    required this.client,
    required this.employeeName
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'client': client,
      'product': product.map((x) => x.toMap()).toList(),
      'employee_name': employeeName,

    };
  }

  factory Orders.fromMap(Map<String, dynamic> map) {
    return Orders(
      client: map['client'] ?? '',
      employeeName: map['employee_name'] as String,
      product: List<Products>.from(
        (map['requests'] as List).map<Products>(
              (x) => Products.fromMap(x as Map<String, dynamic>),
        ),
      ),
    );
  }

  Orders copyWith({
    String? employeeName,
    List<Products>? product,
    Clients? client,

  }) {
    return Orders(
        client: client ?? this.client,
        employeeName: employeeName ?? this.employeeName,
        product: product?? this.product
      //deliveryMethod: deliveryMethod ?? this.deliveryMethod,
    );
  }

  String toJson() => json.encode(toMap());

  factory Orders.fromJson(String source) =>
      Orders.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Orders(employee_name: $employeeName,client: $client, product: $product)';
  }

  @override
  bool operator ==(covariant Orders other) {
    if (identical(this, other)) return true;

    return other.employeeName == employeeName &&
        other.client == client &&
        listEquals(other.product, product) ;
  }

  @override
  int get hashCode {
    return employeeName.hashCode ^
    client.hashCode ^
    product.hashCode ;

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