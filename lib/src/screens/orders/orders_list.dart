import 'dart:convert';

import 'package:camera/camera.dart';
import 'package:doorsandwindows/model/model.dart';
import 'package:doorsandwindows/model/orders.dart';
import 'package:doorsandwindows/model/products.dart';
import 'package:doorsandwindows/model/request.dart';
import 'package:doorsandwindows/model/client.dart';
import 'package:doorsandwindows/src/components/consts.dart';
import 'package:doorsandwindows/src/components/default_button.dart';
import 'package:doorsandwindows/src/screens/products/add_product_screen.dart';
import 'package:doorsandwindows/src/widgets/drop_down_menu.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
class OrdersListScreen extends StatefulWidget {
  final UserRequests order;
  final Clients selectedClient;
  final String token;
  final String employeeId;
  const OrdersListScreen({super.key,
    required this.selectedClient,
    required this.token,
    required this.employeeId,
    required this.order,});

  @override
  State<OrdersListScreen> createState() => _OrdersListScreenState();
}

class _OrdersListScreenState extends State<OrdersListScreen> {

  @override
  void initState() {
    super.initState();
    // readProducts();
    //init();
  }
  TextEditingController heightController = TextEditingController();
  TextEditingController widthController = TextEditingController();
  TextEditingController barcodeController = TextEditingController();

  String selectedCategory = "Category";
  String selectedProduct = "Product";
  String productColor = "Product colors";
  String selectedClassColor = "Class color";

  String productCode = "77VGJH5F7";
  double productHeight = 0.0;
  double productWidth = 0.0;

  // Products? product;
  // List<Products> products=[];
  // Map<String,dynamic>? dataMap;
  // Map<String,dynamic>? doneDataMap;
  // List<dynamic>? data;
  //
  // Future readProducts () async {
  //   http.Response response ;
  //   response= await http.get(Uri.parse('${{baseUrl}}/api/products'));
  //
  //   if(response.statusCode==200)
  //   {
  //     dataMap=jsonDecode(response.body);
  //     doneDataMap=dataMap!['data'];/// for single data
  //
  //     product=Products(
  //       pCode: doneDataMap!['productCode'],
  //       pTitle:doneDataMap!['productName'],
  //       pColor: doneDataMap!['productColor'],
  //       classColor: doneDataMap!['classColor'],
  //       pCategory: doneDataMap!['category'],
  //       pHeight: doneDataMap!['height'],
  //       pWidth:doneDataMap!['width'],
  //     );
  //     data =dataMap!['data']; /// for list of data
  //     for(int x=0;x<data!.length;x++)
  //       products[x]=Products(
  //         pCode: data![x]['productCode'],
  //         pTitle:data![x]['productName'],
  //         pColor: data![x]['productColor'],
  //         classColor: data![x]['classColor'],
  //         pCategory: data![x]['category'],
  //         pHeight: data![x]['height'],
  //         pWidth:data![x]['width'],
  //       );
  //   }
  // }
  //  TextEditingController heightController=TextEditingController();
  //  TextEditingController widthController=TextEditingController();
  //  TextEditingController barcodeController=TextEditingController();

  // String selectedCategory="Category";
  // String selectedProduct="Product";
  // String productColor="Product colors";
  // String selectedClassColor="Class color";
  //
  // String productCode="77VGJH5F7";
  // double productHeight=0.0;
  // double productWidth=0.0;
  //

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: kprimaryColor,
          leading:   IconButton(
              onPressed: () {
                Get.defaultDialog();
                // content: AndroidFullDrawer());
              },
              icon:Icon( Icons.menu,color: Colors.white,)),
          actions:
          [
            const Icon(
              Icons.timer_sharp,
              color: Colors.white,
              size: 30,
            ),
          ]

      ),
      body:  Container(
        height: MediaQuery.of(context).size.height - 200,
        child: ListView.builder(
          itemCount: userCartRequests.length,
          itemBuilder: (context, index) {
            return buildProductCard(
              //userCartRequests[index].myProducts[index],
                Products(
                    quantity: 1,
                    pCode: userCartRequests[index].pCode,
                    pTitle: userCartRequests[index].pTitle,
                    pColor: userCartRequests[index].pColor,
                    classColor: userCartRequests[index].classColor,
                    pCategory: userCartRequests[index].pCategory,
                    pHeight:userCartRequests[index]. pHeight,
                    pWidth: userCartRequests[index].pWidth
                ),
                index
            );
          },
        ),
      ),
      bottomNavigationBar:
      Padding(
          padding: const EdgeInsets.only(
              bottom: 5.0,left: 5.0,right: 5.0),
          child:
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              GestureDetector(
                onTap: (){
                  List<Products> myProducts=[];
                  setState(() {
                    for(int p=0;p<userCartRequests.length;p++)
                    {
                      myProducts.add(Products(
                          quantity: 1,
                          pCode: userCartRequests[p].pCode,
                          pTitle: userCartRequests[p].pTitle,
                          pColor: userCartRequests[p].pColor,
                          classColor: userCartRequests[p].classColor,
                          pCategory: userCartRequests[p].pCategory,
                          pHeight:userCartRequests[p]. pHeight,
                          pWidth: userCartRequests[p].pWidth), );
                    }
                  });
                  createOrder(
                      Orders(client: widget.selectedClient,
                          employeeName: widget.employeeId,
                          status: "Pindding",
                          products:myProducts)
                  );
                },
                child: Padding(
                    padding:
                    const EdgeInsets.only(bottom: 5.0, left: 5.0, right: 5.0),
                    child: Container(
                      padding: EdgeInsets.only(
                        right: 5.h,
                        left: 5.h,
                      ),
                      decoration: BoxDecoration(
                          color: Color(hexStringToHexInt(
                            ('#09A819'),
                          )),
                          border: Border.all(),
                          borderRadius: BorderRadius.circular(5)),
                      width:
                      120.w,
                      //double.infinity,
                      height: 40.h,
                      child: Center(
                        child: Container(
                          height:40,
                          //width: 110,
                          // color: Color(hexStringToHexInt(
                          //   ('#09A819'),
                          // )),
                          child: Center(
                            child: Text(
                              "Update".tr,
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 12,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ),
                    )
                ),
              ),
              Padding(
                  padding: const EdgeInsets.only(
                      bottom: 5.0,left: 5.0,right: 5.0),
                  child:
                  GestureDetector(
                    onTap: (){
                      userCartRequests.clear();
                    },
                    child: Container(
                      padding: EdgeInsets.only(
                        right: 5.h,left: 5.h,),
                      decoration: BoxDecoration(
                          color:Color(hexStringToHexInt(('#ff1717'),)),
                          border:Border.all(),
                          borderRadius: BorderRadius.circular(5)),
                      width:110.w,
                      //double.infinity,
                      height: 40.h,
                      child: Center(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Delete".tr,
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 12,
                                color: Colors.white,
                              ),
                            ),
                            Icon(Icons.cancel,
                              size: 15,color: Colors.white,
                            )
                          ],
                        ),
                      ),
                    ),
                  )
              ),

            ],
          )
        //  DefualtButton(text: "Add Products", selected: true),
      ),
    );
  }

  Card buildProductCard( Products product,index) {
    return Card(
      ///
      color: Color(hexStringToHexInt(('#efffff'),)),
      child: Container(
        child: Column(
          children: <Widget>[
            SizedBox(height: 12.h),
            Container(
              decoration: BoxDecoration(
                  color: Colors.grey.withOpacity(0.5),
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(25),
                    topRight: Radius.circular(25),
                    // topLeft: Border().circular(20)
                  )),
              height: 40,
              width: MediaQuery.of(context).size.width - 20,
              child: Row(
                children: [
                  Container(
                      width: 300.w,
                      child:
                      Center(child: Text("Product Details"))),
                  Container(
                    width: 30.w,
                    child: IconButton(
                        onPressed: () {
                          setState(() {
                            // userCartRequests.removeAt(index);
                            // Get.back();
                          });
                        },
                        icon: Icon(
                          Icons.cancel_sharp,
                          color: Colors.red,
                        )),
                  )
                ],
              ),
            ),

            /// Market DropdownButton
            SizedBox(height: 8.h),
            CustomDropdownButton(
                height: 40,
                width: 350,
                onChanged: (value) {},
                onTap: () {},
                hintText: product.pCategory.tr,
                items: List.generate(
                  1,
                      (index) => DropdownMenuItem(
                      onTap: () {},
                      value: 1,
                      child: Text(product.pCategory.tr,
                          style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 14.sp))),
                )),
            SizedBox(height: 8.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                CustomDropdownButton(
                    height: 40,
                    width: 180,
                    onChanged: (value) {},
                    onTap: () {},
                    hintText: product.pTitle.tr,
                    items: List.generate(
                      1,
                          (index) => DropdownMenuItem(
                          onTap: () {},
                          value: 1,
                          child: Text(product.pTitle.tr,
                              style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 14.sp))),
                    )),
                CustomDropdownButton(
                    height: 40,
                    width: 130,
                    onChanged: (value) {},
                    onTap: () {},

                    hintText: product.pCode.tr,

                    items: List.generate(
                      1,
                          (index) => DropdownMenuItem(
                          onTap: () {},
                          value: 1,
                          child: Text(product.pCode.tr,
                              style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 10.sp))),
                    )),
                //SizedBox(height: 12.h),
              ],
            ),
            SizedBox(height: 8.h),
            CustomDropdownButton(
                height: 40,
                width: 350,
                onChanged: (value) {},
                onTap: () {},
                hintText: product.pTitle+"\t"+"Color".tr+"\t:\t"+product.pColor.tr,
                items: List.generate(
                  products.length,
                      (index) => DropdownMenuItem(
                      onTap: () {},
                      value: 1,
                      child: Text(product.pColor.tr,
                          style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 14.sp))),
                )),
            SizedBox(height: 8.h),
            CustomDropdownButton(
                height: 40,
                width: 350,
                onChanged: (value) {},
                onTap: () {},
                hintText: "Class Color".tr+"\t:\t"+product.classColor.tr,
                items: List.generate(
                  products.length,
                      (index) => DropdownMenuItem(
                      onTap: () {

                      },
                      value: 1,
                      child: Text(
                          "Class Color".tr+":"+"\t"+
                              products[index].classColor.tr,
                          style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 14.sp))),
                )),
            SizedBox(height: 8.h),
            // SizedBox(height: 12.h),

            Padding(
              padding: const EdgeInsets.only(left: 5, right: 5),
              child: Container(
                height: 55,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Padding(
                        padding: const EdgeInsets.only(
                            left: 5, right: 5),
                        child: Material(
                          elevation: 10,
                          borderRadius: BorderRadius.all(
                              Radius.circular(10.r)),
                          child: Container(
                              padding: const EdgeInsets.only(
                                  left: 5, right: 5),
                              width: 150.w,
                              height: 40.h,
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                  color: const Color(0xffEAE9E9),
                                  borderRadius: BorderRadius.all(
                                      Radius.circular(10.r))),
                              child: Text(
                                "Width".tr+"\t\t"+
                                    "${product.pWidth}" + "\t" + "CM".tr,
                                style: TextStyle(
                                    fontWeight: FontWeight.w400,
                                    fontSize: 14.sp),
                              )),
                        )),
                    Padding(
                      padding:
                      const EdgeInsets.only(left: 5, right: 5),
                      child: Material(
                        elevation: 10,
                        borderRadius:
                        BorderRadius.all(Radius.circular(10.r)),
                        child: Container(
                          padding: const EdgeInsets.only(
                              left: 5, right: 5),
                          width: 150.w,
                          height: 40.h,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                              color: const Color(0xffEAE9E9),
                              borderRadius: BorderRadius.all(
                                  Radius.circular(10.r))),
                          child: Text(
                            "Height".tr+"\t"+
                                "${product.pHeight}" + "\t" + "CM".tr,
                            style: TextStyle(
                                fontWeight: FontWeight.w400,
                                fontSize: 14.sp),
                            // prefixIcon: const Icon(Icons.search_sharp),
                            // border: InputBorder.none,
                          ),
                        ),
                      ),
                    ),
                    // Padding(
                    //     padding: const EdgeInsets.only(
                    //         top: 5.0,
                    //         bottom: 5.0,
                    //         left: 5.0,
                    //         right: 5.0),
                    //     child: Container(
                    //       padding: EdgeInsets.only(
                    //         right: 5.h,
                    //         left: 5.h,
                    //       ),
                    //       decoration: BoxDecoration(
                    //           color: Color(hexStringToHexInt(
                    //             ('#23317C'),
                    //           )),
                    //           border: Border.all(),
                    //           borderRadius:
                    //           BorderRadius.circular(5)),
                    //       width: 125.w,
                    //       //double.infinity,
                    //       height: 40.h,
                    //       child: Center(
                    //         child: Row(
                    //           mainAxisAlignment:
                    //           MainAxisAlignment.spaceBetween,
                    //           children: [
                    //             Text(
                    //               "Edit Areas".tr,
                    //               style: TextStyle(
                    //                 fontWeight: FontWeight.bold,
                    //                 fontSize: 12,
                    //                 color: Colors.white,
                    //               ),
                    //             ),
                    //             const Icon(
                    //               Icons.video_camera_back_outlined,
                    //               size: 30,
                    //               color: Colors.white,
                    //             )
                    //           ],
                    //         ),
                    //       ),
                    //       // ),
                    //     )
                    //   //  DefualtButton(text: "Add Products", selected: true),
                    // ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  hexStringToHexInt(String hex) {
    hex = hex.replaceFirst('#', '');
    hex = hex.length == 6 ? 'ff' + hex : hex;
    int val = int.parse(hex, radix: 16);
    return val;
  }


  // late CameraController controller;
  //
  // List<Map<String, dynamic>> yoloResults = [];
  // List<Map<String, dynamic>> allResult = [];
  // CameraImage? cameraImage;
  // bool isLoaded = false;
  // bool isDetecting = false;
  // double confidenceThreshold = 0.5;
  //
  // late List<CameraDescription> cameras;
  //
  //
  // Future<void> init() async {
  //   try {
  //     cameras = await availableCameras();
  //     // vision = FlutterVision();
  //     controller = CameraController(cameras[0], ResolutionPreset.high);
  //     await controller.initialize();
  //     // await loadYoloModel();
  //     setState(() {
  //       isLoaded = true;
  //       isDetecting = false;
  //     });
  //   } catch (e) {
  //     print("Error initializing the camera or loading the model: $e");
  //   }
  // }

  // @override
  // void dispose() {
  //   controller.dispose();
  //   //vision.closeYoloModel();
  //   super.dispose();
  // }
  bool taskDone=false;
  Future<List<dynamic>> createOrder(Orders order)async {

    try {
      final body = json.encode({

        "clientId": order.client.name,
        "employeeId": order.employeeName,
        "products": order.products,
        "status": "pending"

        // "clientId": order.client.employeeId,
        // "products": order.products,
      });
      http.Response response = await http.post(
          Uri.parse('${baseUrl}/api/order'),
          // headers: {
          //   'Authorization': 'Bearer ${widget.token}',
          //   'Content-Type': 'application/json',
          // },
          body:body

      );
      if (response.statusCode == 200){
        setState(() {
          taskDone=true;
        });
        print("Success");
      }
      return  json.decode(response.body);
    }
    catch(error)
    {
      print(error);
    }
    return  [];

  }
}