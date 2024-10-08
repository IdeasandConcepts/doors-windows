// import 'package:food_delivery/model/orders.dart';
// import 'package:food_delivery/model/request.dart';
//
// class UserOrdersList {
//   final Orders order;
//   final String oUser;
//   final int orderNumber;
//   final String status;
//  // final String trackingNumber;
//
//
// UserOrdersList({
//   required this.order,
//   required this.oUser,
//   required this.orderNumber,
//   required this.status,
//   //required this.trackingNumber,
//
// });
//
//   Map<String, dynamic> toMap() {
//     return {
//       'u_user': oUser,
//       'order_number': orderNumber,
//       'status': status,
//       //'tracking_number': trackingNumber,
//       'order':order
//       //List<InventoryProduct>.toMap['inventoryProduct'])
//       //
//       // inventoryProduct.map((i)=>
//       //        i.()).toList(),
//     };
//   }
//
//   factory UserOrdersList.fromMap(Map<String, dynamic> map) {
//     return UserOrdersList(
//       oUser: map['u_user'],
//       orderNumber: map['order_number'],
//       status: map['status'],
//      // trackingNumber: map['tracking_number'],
//       order: map['order']
//
//     );
//   }
//
//
// }