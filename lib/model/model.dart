// import 'package:get/get.dart';
// import 'package:food_delivery/model/request.dart';
// List<Map<String,dynamic>> userOrderList=[
//   {
//
//  "order_number":1947034,
//  "status":"Delivered",
//  "quantity":4,
// "driver_number":"0551332109",
// "date":"20-04-2024",
// "total_amount":123.toDouble(),
// "user_name":'Ahmed Hantop',
// "location":'Dammam,Nakheel,107',
//     //availabilityProduct.map((e) => e.toMap()).toList(),
//  "requests":
//  //UserRequests.map(()=>)e.map.tolist(),
// [
// {
//   "component":[{
//     "item":"Beef",
//     "calories": 272
//   }],
// "title": 'Big Mac'.tr,
// "price":20.toDouble(),
// "size": "E",
//   "quantity":2,
//   "image":"assets/images/image01.png",
// },
// {
//   "component":[{
//     "item":"Beef",
//     "calories": 272
//   }],
//   "title": 'Big Mac'.tr,
//   "price":20.toDouble(),
//   "size": "M",
//   "quantity":2,
//   "image":"assets/images/image02.png",
// },].toList() as UserRequests,
//
//   }
// ];
import 'package:doorsandwindows/model/client.dart';
import 'package:doorsandwindows/model/products.dart';
import 'package:doorsandwindows/model/users.dart';
import 'package:get/get.dart';

List<Map<String, dynamic>> component = [
{
"item":"Beef",
"calories": 272
},
  {
"item":"Cheese",
"calories": 80
},
  {
"item":"Fries-S",
"calories": 342
},
  {
"item":"Fries-R",
"calories": 486
},
  {
    "item":"Fries-M",
    "calories": 685
  },  {
    "item":"Fries-L",
    "calories": 808
  },
  {
"item":"Garden Salad",
"calories": 56
},{
"item":"Side Salad",
"calories": 27
},{
"item":"ketchup",
"calories": 11
},{
"item":"Coca-Cola-S",
"calories": 102
},{
"item":"Coca-Cola-M",
"calories": 201
},
];
// List<Products> productsData = [
//   const Products(
//       pCode: "bd3g737f4",
//       pTitle: "Classic door",
//       pColor: "grey",
//       classColor: "Of white",
//       pCategory: "Doors",
//       pHeight: 400.0,
//       pWidth:180.0
//   ), const Products(
//       pCode: "bd3g7f423",
//       pTitle: "Classic window",
//       pColor: "white",
//       classColor: "blue",
//       pCategory: "windows",
//       pHeight: 200.0,
//       pWidth:200.0
//   ), const Products(
//       pCode: "g8737hhf4",
//       pTitle: "Aluminium door",
//       pColor: "brown",
//       classColor: "Of white",
//       pCategory: "Doors",
//       pHeight: 500.0,
//       pWidth:200.0
//   ),
//   const Products(
//       pCode: "bd3g737f4",
//       pTitle: "Class window",
//       pColor: "black",
//       classColor: "Of white",
//       pCategory: "windows",
//       pHeight: 170.0,
//       pWidth:200.0
//   ),
//
// ];
List<Clients> clientData=[
  const Clients(
      employeeId:"Adel",
      lat: 0.0,
      lang: 0.0,
      name: "Ahmed Hantop",
      address: "El-dahia",
      phoneNumber: "0555341333",
      email: "ahmed@gmail.com",
      profileImage: "assets/images/profile.png"),
  const Clients(
      employeeId:"Ahmed",
      lat: 0.0,
      lang: 0.0,
      name: "Mohamad Hosny",
      address: "El-badia",
      phoneNumber: "0595333787",
      email: "mohamad@gmail.com",
      profileImage: "assets/images/profile.png"),
  const Clients(
      employeeId:"Omer",
    lat: 0.0,
      lang: 0.0,
      name: "Mohamed ahmed",
      address: "El-jalawya",
      phoneNumber: "0536864333",
      email: "aboahmed@gmail.com",
      profileImage: "assets/images/profile.png"),

];

// List<Map<String, dynamic>> burger = [
//   {
//     "is_favorite":true,
//     "title": 'Big Mac'.tr,
//     "old_price":25.toDouble(),
//     "price":20.toDouble(),
//     "description":"Ever wondered what's on a Big Mac®? The McDonald's Big Mac® is a 100% beef burger with a taste like no other. The mouthwatering perfection starts with two 100% pure all beef patties and Big Mac® sauce sandwiched between a sesame seed bun. It’s topped off with pickles, crisp shredded lettuce, finely chopped onion, and a slice of American cheese. It contains no artificial flavors, preservatives, or added colors from artificial sources. Our pickle contains an artificial preservative, so skip it if you like.",
//     "image":"assets/images/image01.png",
//   },
//   {
//     "is_favorite":true,
//     "title": 'Quarter Pounder'.tr,
//     "old_price":20.toDouble(),
//     "price":18.toDouble(),
//     "description":"fresh beef that’s hot, deliciously juicy and cooked when you order. What comes on a Quarter Pounder? Each fresh beef burger is seasoned with just a pinch of salt and pepper, sizzled on a flat iron grill, then topped with slivered onions, tangy pickles and two slices of melty American cheese on a sesame seed bun. Our QPC® contains no artificial flavors, preservatives or added colors from artificial sources.^ Our pickle contains an artificial preservative, so skip it if you like. A Quarter Pounder with Cheese has 520 Calories.",
//     "image":"assets/images/image02.png",
//   },
//   {
//     "is_favorite":false,
//     "title": 'cheese Burger'.tr,
//     "old_price":20.toDouble(),
//     "price":18.toDouble(),
//     "description":"Enjoy the cheesy deliciousness of a McDonald’s Cheeseburger! Our simple, classic cheeseburger begins with a 100% pure beef burger patty seasoned with just a pinch of salt and pepper. The McDonald’s Cheeseburger is topped with a tangy pickle, chopped onions, ketchup, mustard, and a slice of melty American cheese. It contains no artificial flavors, preservatives or added colors from artificial sources.* Our pickle contains an artificial preservative,",
//     "image":"assets/images/image02.png",
//   },
//   {
//     "is_favorite":false,
//     "title": 'Sausage Burrito'.tr,
//     "old_price":20.toDouble(),
//     "price":18.toDouble(),
//     "description":"Start your day off with a loaded Egg and Sausage Burrito from the McDonald's breakfast menu McDonald's Breakfast Burrito recipe is loaded with fluffy scrambled egg, pork sausage, melty cheese, green chiles, and onion! It's wrapped in a soft tortilla, making it the perfect grab and go breakfast. There are 310 calories in a McDonald's Sausage breakfast burrito. Enjoy it as a snack or grab a Sausage Burrito Meal with a crispy golden Hash Browns and a small McCafé® Premium Roast Coffee",
//     "image":"assets/images/ausageBurrito.jpeg",
//   },
//   {
//     "is_favorite":true,
//     "title": 'Iced Coffee'.tr,
//     "old_price":12.toDouble(),
//     "price":10.toDouble(),
//     "description":"Enjoy a refreshingly cool Iced Coffee at McDonald’s! Our McCafé Iced Coffee recipe is made with 100% Arabica beans, cream, and your choice of flavored coffee syrup—Caramel, Hazelnut, French Vanilla, and Sugar-Free French Vanilla.* A fan of black coffee? Get it without the sugar or cream to refresh your mornings with a cool Black Iced Coffee.",
//     "image":"assets/images/IcedCoffeeGlass.jpeg",
//   },
//   {
//     "is_favorite":true,
//     "title": 'Sausage McGriddles®'.tr,
//     "old_price":10.toDouble(),
//     "price":10.toDouble(),
//     "description":"Enjoy a refreshingly cool Iced Coffee at McDonald’s! Our McCafé Iced Coffee recipe is made with 100% Arabica beans, cream, and your choice of flavored coffee syrup—Caramel, Hazelnut, French Vanilla, and Sugar-Free French Vanilla.* A fan of black coffee? Get it without the sugar or cream to refresh your mornings with a cool Black Iced Coffee.",
//     "image":"assets/images/Sausage McGriddles.jpeg",
//   },
//
// ];
// List<Map<String, dynamic>> bread = [
//   {
//     "is_favorite":true,
//     "title": 'Big Mac'.tr,
//     "old_price":25.toDouble(),
//     "price":20.toDouble(),
//     "description":"Ever wondered what's on a Big Mac®? The McDonald's Big Mac® is a 100% beef burger with a taste like no other. The mouthwatering perfection starts with two 100% pure all beef patties and Big Mac® sauce sandwiched between a sesame seed bun. It’s topped off with pickles, crisp shredded lettuce, finely chopped onion, and a slice of American cheese. It contains no artificial flavors, preservatives, or added colors from artificial sources. Our pickle contains an artificial preservative, so skip it if you like.",
//     "image":"assets/images/image01.png",
//   },
//   {
//     "is_favorite":true,
//     "title": 'Quarter Pounder'.tr,
//     "old_price":20.toDouble(),
//     "price":18.toDouble(),
//     "description":"Quarter Pounder with Cheese 520 cal , Each Quarter Pounder with Cheese burger features a ¼ lb.* of 100% fresh beef that’s hot, deliciously juicy and cooked when you order. What comes on a Quarter Pounder? Each fresh beef burger is seasoned with just a pinch of salt and pepper, sizzled on a flat iron grill, then topped with slivered onions, tangy pickles and two slices of melty American cheese on a sesame seed bun. Our QPC® contains no artificial flavors, preservatives or added colors from artificial sources.^ Our pickle contains an artificial preservative, so skip it if you like. A Quarter Pounder with Cheese has 520 Calories.",
//     "image":"assets/images/image02.png",
//   },
//   {
//     "is_favorite":false,
//     "title": 'cheese Burger'.tr,
//     "old_price":20.toDouble(),
//     "price":18.toDouble(),
//     "description":"Enjoy the cheesy deliciousness of a McDonald’s Cheeseburger! Our simple, classic cheeseburger begins with a 100% pure beef burger patty seasoned with just a pinch of salt and pepper. The McDonald’s Cheeseburger is topped with a tangy pickle, chopped onions, ketchup, mustard, and a slice of melty American cheese. It contains no artificial flavors, preservatives or added colors from artificial sources.* Our pickle contains an artificial preservative,",
//     "image":"assets/images/image02.png",
//   },
//   {
//     "is_favorite":false,
//     "title": 'Sausage Burrito'.tr,
//     "old_price":20.toDouble(),
//     "price":18.toDouble(),
//     "description":"Start your day off with a loaded Egg and Sausage Burrito from the McDonald's breakfast menu McDonald's Breakfast Burrito recipe is loaded with fluffy scrambled egg, pork sausage, melty cheese, green chiles, and onion! It's wrapped in a soft tortilla, making it the perfect grab and go breakfast. There are 310 calories in a McDonald's Sausage breakfast burrito. Enjoy it as a snack or grab a Sausage Burrito Meal with a crispy golden Hash Browns and a small McCafé® Premium Roast Coffee",
//     "image":"assets/images/ausageBurrito.jpeg",
//   },
//   {
//     "is_favorite":true,
//     "title": 'Iced Coffee'.tr,
//     "old_price":12.toDouble(),
//     "price":10.toDouble(),
//     "description":"Enjoy a refreshingly cool Iced Coffee at McDonald’s! Our McCafé Iced Coffee recipe is made with 100% Arabica beans, cream, and your choice of flavored coffee syrup—Caramel, Hazelnut, French Vanilla, and Sugar-Free French Vanilla.* A fan of black coffee? Get it without the sugar or cream to refresh your mornings with a cool Black Iced Coffee.",
//     "image":"assets/images/IcedCoffeeGlass.jpeg",
//   },
//   {
//     "is_favorite":true,
//     "title": 'Sausage McGriddles®'.tr,
//     "old_price":10.toDouble(),
//     "price":10.toDouble(),
//     "description":"Enjoy a refreshingly cool Iced Coffee at McDonald’s! Our McCafé Iced Coffee recipe is made with 100% Arabica beans, cream, and your choice of flavored coffee syrup—Caramel, Hazelnut, French Vanilla, and Sugar-Free French Vanilla.* A fan of black coffee? Get it without the sugar or cream to refresh your mornings with a cool Black Iced Coffee.",
//     "image":"assets/images/Sausage McGriddles.jpeg",
//   },
//
// ];
// List<Map<String, dynamic>> pizza = [
//   {
//     "is_favorite":true,
//     "title": 'Pizza Napoletana'.tr,
//     "old_price":25.toDouble(),
//     "price":20.toDouble(),
//     "description":"Ever wondered what's on a Big Mac®? The McDonald's Big Mac® is a 100% beef burger with a taste like no other. The mouthwatering perfection starts with two 100% pure all beef patties and Big Mac® sauce sandwiched between a sesame seed bun. It’s topped off with pickles, crisp shredded lettuce, finely chopped onion, and a slice of American cheese. It contains no artificial flavors, preservatives, or added colors from artificial sources. Our pickle contains an artificial preservative, so skip it if you like.",
//     "image":"assets/images/Pizza Napoletana.avif",
//   },
//   {
//     "is_favorite":true,
//     "title": 'Quarter Pounder'.tr,
//     "old_price":20.toDouble(),
//     "price":18.toDouble(),
//     "description":"Quarter Pounder with Cheese 520 cal , Each Quarter Pounder with Cheese burger features a ¼ lb.* of 100% fresh beef that’s hot, deliciously juicy and cooked when you order. What comes on a Quarter Pounder? Each fresh beef burger is seasoned with just a pinch of salt and pepper, sizzled on a flat iron grill, then topped with slivered onions, tangy pickles and two slices of melty American cheese on a sesame seed bun. Our QPC® contains no artificial flavors, preservatives or added colors from artificial sources.^ Our pickle contains an artificial preservative, so skip it if you like. A Quarter Pounder with Cheese has 520 Calories.",
//     "image":"assets/images/image02.png",
//   },
//   {
//     "is_favorite":false,
//     "title": 'cheese Burger'.tr,
//     "old_price":20.toDouble(),
//     "price":18.toDouble(),
//     "description":"Enjoy the cheesy deliciousness of a McDonald’s Cheeseburger! Our simple, classic cheeseburger begins with a 100% pure beef burger patty seasoned with just a pinch of salt and pepper. The McDonald’s Cheeseburger is topped with a tangy pickle, chopped onions, ketchup, mustard, and a slice of melty American cheese. It contains no artificial flavors, preservatives or added colors from artificial sources.* Our pickle contains an artificial preservative,",
//     "image":"assets/images/image02.png",
//   },
//   {
//     "is_favorite":false,
//     "title": 'Sausage Burrito'.tr,
//     "old_price":20.toDouble(),
//     "price":18.toDouble(),
//     "description":"Start your day off with a loaded Egg and Sausage Burrito from the McDonald's breakfast menu McDonald's Breakfast Burrito recipe is loaded with fluffy scrambled egg, pork sausage, melty cheese, green chiles, and onion! It's wrapped in a soft tortilla, making it the perfect grab and go breakfast. There are 310 calories in a McDonald's Sausage breakfast burrito. Enjoy it as a snack or grab a Sausage Burrito Meal with a crispy golden Hash Browns and a small McCafé® Premium Roast Coffee",
//     "image":"assets/images/ausageBurrito.jpeg",
//   },
//   {
//     "is_favorite":true,
//     "title": 'Iced Coffee'.tr,
//     "old_price":12.toDouble(),
//     "price":10.toDouble(),
//     "description":"Enjoy a refreshingly cool Iced Coffee at McDonald’s! Our McCafé Iced Coffee recipe is made with 100% Arabica beans, cream, and your choice of flavored coffee syrup—Caramel, Hazelnut, French Vanilla, and Sugar-Free French Vanilla.* A fan of black coffee? Get it without the sugar or cream to refresh your mornings with a cool Black Iced Coffee.",
//     "image":"assets/images/IcedCoffeeGlass.jpeg",
//   },
//   {
//     "is_favorite":true,
//     "title": 'Sausage McGriddles®'.tr,
//     "old_price":10.toDouble(),
//     "price":10.toDouble(),
//     "description":"Enjoy a refreshingly cool Iced Coffee at McDonald’s! Our McCafé Iced Coffee recipe is made with 100% Arabica beans, cream, and your choice of flavored coffee syrup—Caramel, Hazelnut, French Vanilla, and Sugar-Free French Vanilla.* A fan of black coffee? Get it without the sugar or cream to refresh your mornings with a cool Black Iced Coffee.",
//     "image":"assets/images/Sausage McGriddles.jpeg",
//   },
//
// ];
//
// List<Map<String, dynamic>> juice = [
//   {
//     "is_favorite":true,
//     "title": 'Big Mac'.tr,
//     "old_price":25.toDouble(),
//     "price":20.toDouble(),
//     "description":"Ever wondered what's on a Big Mac®? The McDonald's Big Mac® is a 100% beef burger with a taste like no other. The mouthwatering perfection starts with two 100% pure all beef patties and Big Mac® sauce sandwiched between a sesame seed bun. It’s topped off with pickles, crisp shredded lettuce, finely chopped onion, and a slice of American cheese. It contains no artificial flavors, preservatives, or added colors from artificial sources. Our pickle contains an artificial preservative, so skip it if you like.",
//     "image":"assets/images/image01.png",
//   },
//   {
//     "is_favorite":true,
//     "title": 'Quarter Pounder'.tr,
//     "old_price":20.toDouble(),
//     "price":18.toDouble(),
//     "description":"Quarter Pounder with Cheese 520 cal , Each Quarter Pounder with Cheese burger features a ¼ lb.* of 100% fresh beef that’s hot, deliciously juicy and cooked when you order. What comes on a Quarter Pounder? Each fresh beef burger is seasoned with just a pinch of salt and pepper, sizzled on a flat iron grill, then topped with slivered onions, tangy pickles and two slices of melty American cheese on a sesame seed bun. Our QPC® contains no artificial flavors, preservatives or added colors from artificial sources.^ Our pickle contains an artificial preservative, so skip it if you like. A Quarter Pounder with Cheese has 520 Calories.",
//     "image":"assets/images/image02.png",
//   },
//   {
//     "is_favorite":false,
//     "title": 'cheese Burger'.tr,
//     "old_price":20.toDouble(),
//     "price":18.toDouble(),
//     "description":"Enjoy the cheesy deliciousness of a McDonald’s Cheeseburger! Our simple, classic cheeseburger begins with a 100% pure beef burger patty seasoned with just a pinch of salt and pepper. The McDonald’s Cheeseburger is topped with a tangy pickle, chopped onions, ketchup, mustard, and a slice of melty American cheese. It contains no artificial flavors, preservatives or added colors from artificial sources.* Our pickle contains an artificial preservative,",
//     "image":"assets/images/image02.png",
//   },
//   {
//     "is_favorite":false,
//     "title": 'Sausage Burrito'.tr,
//     "old_price":20.toDouble(),
//     "price":18.toDouble(),
//     "description":"Start your day off with a loaded Egg and Sausage Burrito from the McDonald's breakfast menu McDonald's Breakfast Burrito recipe is loaded with fluffy scrambled egg, pork sausage, melty cheese, green chiles, and onion! It's wrapped in a soft tortilla, making it the perfect grab and go breakfast. There are 310 calories in a McDonald's Sausage breakfast burrito. Enjoy it as a snack or grab a Sausage Burrito Meal with a crispy golden Hash Browns and a small McCafé® Premium Roast Coffee",
//     "image":"assets/images/ausageBurrito.jpeg",
//   },
//   {
//     "is_favorite":true,
//     "title": 'Iced Coffee'.tr,
//     "old_price":12.toDouble(),
//     "price":10.toDouble(),
//     "description":"Enjoy a refreshingly cool Iced Coffee at McDonald’s! Our McCafé Iced Coffee recipe is made with 100% Arabica beans, cream, and your choice of flavored coffee syrup—Caramel, Hazelnut, French Vanilla, and Sugar-Free French Vanilla.* A fan of black coffee? Get it without the sugar or cream to refresh your mornings with a cool Black Iced Coffee.",
//     "image":"assets/images/IcedCoffeeGlass.jpeg",
//   },
//   {
//     "is_favorite":true,
//     "title": 'Sausage McGriddles®'.tr,
//     "old_price":10.toDouble(),
//     "price":10.toDouble(),
//     "description":"Enjoy a refreshingly cool Iced Coffee at McDonald’s! Our McCafé Iced Coffee recipe is made with 100% Arabica beans, cream, and your choice of flavored coffee syrup—Caramel, Hazelnut, French Vanilla, and Sugar-Free French Vanilla.* A fan of black coffee? Get it without the sugar or cream to refresh your mornings with a cool Black Iced Coffee.",
//     "image":"assets/images/Sausage McGriddles.jpeg",
//   },
//
// ];

