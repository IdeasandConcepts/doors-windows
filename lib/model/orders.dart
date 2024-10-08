// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:doorsandwindows/model/request.dart';
import 'package:flutter/foundation.dart';

class Orders {
  final String market,branch;
  final double offer;
  final String user;
  final String profileImage;
  final String step;
  //final String deliveryTime;
  final double id;
   int orderNumber;
  final String status;
  final String acceptedTime;
  final List<UserRequests> requests;
 final String paymentMethod;
  final String uDate;
  final String uTime;
  //final int uTotalRequests;
  final double uTotalPrice;
  // final double lat;
  // final double lan;
  final String deliveryTime;

  Orders( {
    required this.offer,
    required this.user,
    required this.profileImage,
    required this.step,
    required this.paymentMethod,
    required this.id,
    required this.orderNumber,
    required this.status,
    required this.acceptedTime,
    required this.requests,
    //required this.paymentMethod,
    required this.uDate,
    required this.uTime,
    required this.uTotalPrice,
    required this.market,
    required this.branch,
    required this.deliveryTime,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'user': user,
      'profile_image': profileImage,
      'step': step,
      'delivery_time': deliveryTime,
      'id': id,
      'order_number': orderNumber,
      'status': status,
      'accepted_time': acceptedTime,
      'requests': requests.map((x) => x.toMap()).toList(),
      'payment_method': paymentMethod,
      'u_date': uDate,
      'u_time': uTime,
      'total_price': uTotalPrice,
      'market': market,
      'branch': branch,
     // 'delivery_method': deliveryMethod,
      'offer':offer,
    };
  }

  factory Orders.fromMap(Map<String, dynamic> map) {
    return Orders(
      offer: map['offer'] as double,
      user: map['user'] ?? '',
      profileImage: map['profile_image'] ?? '',
      step: map['step'] ?? '',
     deliveryTime: map['delivery_time'] ?? '',
      id: map['id'] ?? 0,
      orderNumber: map['order_number'] ?? 0,
      status: map['status'] as String,
      acceptedTime: map['accepted_time'] as String,
      requests: List<UserRequests>.from(
        (map['requests'] as List).map<UserRequests>(
          (x) => UserRequests.fromMap(x as Map<String, dynamic>),
        ),
      ),
      paymentMethod: map['payment_method'] as String,
      uDate: map['u_date'] as String,
      uTime: map['u_time'] as String,
      uTotalPrice: map['total_price'] as double,
      market: map['market'] as String,
      branch: map['branch'] as String,
      //deliveryMethod: map['delivery_method'] as String,
    );
  }

  Orders copyWith({
    String? user,
    String? profileImage,
    String? step,
    String? deliveryTime,
    double? id,
    int? orderNumber,
    String? status,
    String? acceptedTime,
    List<UserRequests>? requests,
    String? paymentMethod,
    String? uDate,
    String? uTime,
    double? uTotalPrice,
    String? market,
    String? branch,
    String? deliveryMethod,
    double? offer,
  }) {
    return Orders(
      offer: offer ?? this.offer,
      user: user ?? this.user,
      profileImage: profileImage ?? this.profileImage,
      step: step ?? this.step,
     deliveryTime: deliveryTime ?? this.deliveryTime,
      id: id ?? this.id,
      orderNumber: orderNumber ?? this.orderNumber,
      status: status ?? this.status,
      acceptedTime: acceptedTime ?? this.acceptedTime,
      requests: requests ?? this.requests,
      paymentMethod: paymentMethod ?? this.paymentMethod,
      uDate: uDate ?? this.uDate,
      uTime: uTime ?? this.uTime,
      uTotalPrice: uTotalPrice ?? this.uTotalPrice,
      market: market ?? this.market,
      branch: branch ?? this.branch,
      //deliveryMethod: deliveryMethod ?? this.deliveryMethod,
    );
  }

  String toJson() => json.encode(toMap());

  factory Orders.fromJson(String source) =>
      Orders.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Orders(user: $user,profileImage: $profileImage,step: $step,'
        'deliveryTime: $deliveryTime,'
        'id: $id, orderNumber: $orderNumber, status: $status,acceptedTime: $acceptedTime,requests: $requests, '
        'paymentMethod: $paymentMethod,'
        'uDate: $uDate, uTime: $uTime, uTotalPrice: $uTotalPrice, '
        //'lat: $lat, lan: $lan'
       // ', deliveryMethod: $deliveryMethod,'
        'offer: $offer)';
  }

  @override
  bool operator ==(covariant Orders other) {
    if (identical(this, other)) return true;

    return other.user == user &&
        other.offer == offer &&
        other.profileImage == profileImage &&
        other.step == step &&
       // other.deliveryTime == deliveryTime &&
        other.id == id &&
        other.orderNumber == orderNumber &&
        other.status == status &&
        other.acceptedTime == acceptedTime &&
        listEquals(other.requests, requests) &&
        other.paymentMethod == paymentMethod &&
        other.uDate == uDate &&
        other.uTime == uTime &&
        other.uTotalPrice == uTotalPrice ;
    //&&
        // other.lat == lat &&
        // other.lan == lan &&
        //other.deliveryMethod == deliveryMethod;
  }

  @override
  int get hashCode {
    return user.hashCode ^
        offer.hashCode ^
        profileImage.hashCode ^
        step.hashCode ^
        deliveryTime.hashCode ^
        id.hashCode ^
        orderNumber.hashCode ^
        status.hashCode ^
        acceptedTime.hashCode ^
        requests.hashCode ^
        paymentMethod.hashCode ^
        uDate.hashCode ^
        uTime.hashCode ^
        uTotalPrice.hashCode;
    //^
        // lat.hashCode ^
        // lan.hashCode ^
       // deliveryMethod.hashCode;
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