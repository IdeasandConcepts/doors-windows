import 'dart:convert';

import 'package:camera/camera.dart';
import 'package:doorsandwindows/model/client.dart';
import 'package:doorsandwindows/model/model.dart';
import 'package:doorsandwindows/model/products.dart';
import 'package:doorsandwindows/model/request.dart';
import 'package:doorsandwindows/src/components/consts.dart';
import 'package:doorsandwindows/src/screens/products/products_list.dart';
import 'package:doorsandwindows/src/widgets/drop_down_menu.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class AddProductsScreen extends StatefulWidget {
  final Clients selectedClient;
  final String token;
  final String employeeId;
  const AddProductsScreen({
    super.key,
    required this.selectedClient,
    required this.token,
    required this.employeeId,
  });

  @override
  State<AddProductsScreen> createState() => _AddProductsScreenState();
}

class _AddProductsScreenState extends State<AddProductsScreen> {
  bool isLoading = false;
  @override
  void initState() {
    // TODO: implement initState
    if (products.isNotEmpty) {
      setState(() {
        isLoading = true;
      });
    }
    super.initState();
  }
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
  //}

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: kprimaryColor,
          leading: IconButton(
              onPressed: () {
                Get.defaultDialog();
                // content: AndroidFullDrawer());
              },
              icon: Icon(
                Icons.menu,
                color: Colors.white,
              )),
          actions: [
            Padding(
              padding: const EdgeInsets.only(left: 12.0, right: 15),
              child: Icon(
                Icons.timer_sharp,
                color: Colors.white,
                size: 30,
              ),
            ),
          ]),
      body: (isLoading == true)
          ? ListView(
              shrinkWrap: true,
              children: <Widget>[
                Card(
                  color: Color(hexStringToHexInt(
                    ('#efffff'),
                  )),
                  child: Container(
                    child: Column(
                      children: <Widget>[
                        SizedBox(height: 4.h),
                        Container(
                          decoration: BoxDecoration(
                              color: Colors.grey.withOpacity(0.5),
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(4),
                                topRight: Radius.circular(4),
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
                                    onPressed: () {},
                                    icon: Icon(
                                      Icons.cancel_sharp,
                                      color: Colors.red,
                                    )),
                              )
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 10.h,
                        ),

                        /// category DropdownButton
                        CustomDropdownButton(
                          height: 40,
                          width: 350,
                          onChanged: (value) {},
                          onTap: () {},
                          hintText: selectedCategory.tr,
                          items: List.generate(
                            //categories.length,
                            //  productsData.length,
                            products.length,
                            (index) => DropdownMenuItem(
                                onTap: () {
                                  setState(() {
                                    selectedCategory =
                                        products[index].pCategory;
                                  });
                                },
                                value: 1,
                                child: Text(products[index].pCategory,
                                    style: TextStyle(
                                        fontWeight: FontWeight.w500,
                                        fontSize: 14.sp))),
                          ),
                        ),
                        SizedBox(height: 10.h),
                        /// Market DropdownButton
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: <Widget>[
                            CustomDropdownButton(
                                height: 40,
                                width: 175,
                                onChanged: (value) {},
                                onTap: () {},
                                hintText: selectedProduct.tr,
                                items: List.generate(
                                  (selectedCategory != "Category")? products.length:1,
                                  (index) => DropdownMenuItem(
                                      onTap: () {
                                        setState(() {
                                          selectedProduct =
                                              products[index].pTitle;
                                          productCode = products[index].pCode;
                                          productWidth = products[index].pWidth;
                                          productHeight =
                                              products[index].pHeight;
                                        });
                                      },
                                      value: 1,
                                      child: Text(products[index].pTitle,
                                          style: TextStyle(
                                              fontWeight: FontWeight.w500,
                                              fontSize: 14.sp))),
                                )),
                            Padding(
                                padding:
                                    const EdgeInsets.only(left: 10, right: 10),
                                child: Material(
                                  elevation: 10,
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10.r)),
                                  child: Container(
                                    width: 135.w,
                                    height: 40.h,
                                    alignment: Alignment.center,
                                    decoration: BoxDecoration(
                                        border: Border.all(),
                                        color: Color(hexStringToHexInt(
                                          ('#FBFBFB'),
                                        )),
                                        //Colors.white,
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(4.r))),
                                    child: (selectedProduct == "Product")
                                        ? TextField(
                                            controller: barcodeController,
                                            decoration: InputDecoration(
                                              hintText: "Barcode".tr,
                                              hintStyle: TextStyle(
                                                  fontWeight: FontWeight.w400,
                                                  fontSize: 14.sp),
                                              prefixIcon: const Icon(
                                                  Icons.search_sharp),
                                              border: InputBorder.none,
                                            ),
                                            onChanged: (value) {
                                              setState(() {});
                                            },
                                            onSubmitted: (newValue) {
                                              setState(() {});
                                            },
                                          )
                                        : Text(productCode),
                                  ),
                                )),
                          ],
                        ),

                        SizedBox(height: 10.h),

                        /// Merchandisers DropdownButton
                        CustomDropdownButton(
                            height: 40,
                            width: 350,
                            onChanged: (value) {},
                            onTap: () {},
                            hintText: productColor.tr,
                            items: List.generate(
                              products.length,
                              (index) => DropdownMenuItem(
                                  onTap: () {
                                    setState(() {
                                      productColor = products[index].pColor;
                                    });
                                  },
                                  value: 1,
                                  child: Text(products[index].pColor,
                                      style: TextStyle(
                                          fontWeight: FontWeight.w500,
                                          fontSize: 14.sp))),
                            )),
                        SizedBox(height: 10.h),
                        CustomDropdownButton(
                            height: 40,
                            width: 350.w,
                            onChanged: (value) {},
                            onTap: () {},
                            hintText: selectedClassColor.tr,
                            items: List.generate(
                              products.length,
                              (index) => DropdownMenuItem(
                                  onTap: () {
                                    setState(() {
                                      selectedClassColor =
                                          products[index].classColor;
                                    });
                                  },
                                  value: 1,
                                  child: Text(products[index].classColor,
                                      style: TextStyle(
                                          fontWeight: FontWeight.w500,
                                          fontSize: 14.sp))),
                            )),
                        SizedBox(height: 10.h),
                        Padding(
                          padding: const EdgeInsets.only(left: 5, right: 5),
                          child: Container(
                            height: 55,
                            child: Row(
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
                                        width: 90.w,
                                        height: 40.h,
                                        alignment: Alignment.center,
                                        decoration: BoxDecoration(
                                            color: Color(hexStringToHexInt(
                                              ('#FBFBFB'),
                                            )),
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(4.r))),
                                        child: TextField(
                                          controller: widthController,
                                          keyboardType: TextInputType.number,
                                          decoration: InputDecoration(
                                            hintText: "${productWidth}".tr,
                                            hintStyle: TextStyle(
                                                fontWeight: FontWeight.w400,
                                                fontSize: 14.sp),
                                            border: InputBorder.none,
                                          ),
                                          onChanged: (value) {
                                            setState(() {
                                              productWidth = double.parse(
                                                  widthController.text);
                                            });
                                          },
                                          onSubmitted: (newValue) {
                                            setState(() {
                                              productWidth = double.parse(
                                                  widthController.text);
                                            });
                                          },
                                        ),
                                      ),
                                    )),
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
                                        width: 90.w,
                                        height: 40.h,
                                        alignment: Alignment.center,
                                        decoration: BoxDecoration(
                                            color: Color(hexStringToHexInt(
                                              ('#FBFBFB'),
                                            )),
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(4.r))),
                                        child: TextField(
                                          controller: heightController,
                                          keyboardType: TextInputType.number,
                                          decoration: InputDecoration(
                                            hintText: "${productHeight}",
                                            hintStyle: TextStyle(
                                                fontWeight: FontWeight.w400,
                                                fontSize: 14.sp),
                                            // prefixIcon: const Icon(Icons.search_sharp),
                                            border: InputBorder.none,
                                          ),
                                          onChanged: (value) {
                                            setState(() {
                                              productHeight = double.parse(
                                                  heightController.text);
                                            });
                                          },
                                          onSubmitted: (newValue) {
                                            setState(() {
                                              productHeight = double.parse(
                                                  heightController.text);

                                              // getId();
                                              // searchResult=newValue;
                                              // runFilter(newValue);
                                              // searchResult=newValue;
                                            });
                                          },
                                        ),
                                      ),
                                    )),
                                Padding(
                                    padding: const EdgeInsets.only(
                                        top: 5.0,
                                        bottom: 5.0,
                                        left: 5.0,
                                        right: 5.0),
                                    child: GestureDetector(
                                      onTap: () {
                                        Get.defaultDialog(
                                            title: "",
                                            content: Container(
                                              height: 400,
                                              width: 400,
                                              // child: AspectRatio(
                                              //   aspectRatio: controller.value.aspectRatio,
                                              //   child: CameraPreview(controller),
                                              // ),
                                              // ...displayBoxesAroundRecognizedObjects(size),
                                            ));
                                      },
                                      child: Container(
                                        padding: EdgeInsets.only(
                                          right: 5.h,
                                          left: 5.h,
                                        ),
                                        decoration: BoxDecoration(
                                            color: Color(hexStringToHexInt(
                                              ('#23317C'),
                                            )),
                                            border: Border.all(),
                                            borderRadius:
                                                BorderRadius.circular(4)),
                                        width: 125.w,
                                        //double.infinity,
                                        height: 40.h,
                                        child: Center(
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text(
                                                "Add Areas".tr,
                                                style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 12,
                                                  color: Colors.white,
                                                ),
                                              ),
                                              Icon(
                                                Icons
                                                    .video_camera_back_outlined,
                                                size: 30,
                                                color: Colors.white,
                                              )
                                            ],
                                          ),
                                        ),
                                        // ),
                                      ),
                                    )
                                    //  DefualtButton(text: "Add Products", selected: true),
                                    ),
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                    //width: double.infinity,
                    // height: ,
                  ),
                ),
                Padding(
                    padding: const EdgeInsets.only(
                        bottom: 5.0, left: 5.0, right: 5.0),
                    child: GestureDetector(
                      onTap: () {
                        if ((selectedProduct != "Product") &&
                            (selectedCategory != "Category") &&
                            (productColor != "Product colors") &&
                            (selectedClassColor != "Class color") &&
                            (productCode != "77VGJH5F7") &&
                            (productHeight != 0.0) &&
                            (productWidth != 0.0)) {
                          if (SelectedUserRequests.contains(selectedProduct +
                              productCode +
                              selectedCategory)) {
                            Get.snackbar(
                              //dismissDirection:,
                                'Error',
                                "This data has already been add");
                          }

                          else {
                            userCartRequests.add(UserRequests(
                               pCategory: selectedCategory,
                                pWidth: productWidth,
                                classColor: selectedClassColor,
                                pTitle: selectedProduct,
                                pColor: productColor,
                                pCode: productCode,
                                pHeight: productHeight
                                // )
                                ));
                            SelectedUserRequests.add(selectedProduct +
                                productCode +
                                selectedCategory);
                            Get.to(() => ProductsListScreen(
                                  selectedClient: widget.selectedClient,
                                  employeeId: widget.employeeId,
                                  token: widget.token,
                                ));
                            setState(() {
                              selectedProduct = "Product";
                              selectedCategory = "Category";
                              productColor = "Product colors";
                              selectedClassColor = "Class color";
                              productCode = "77VGJH5F7";
                              productHeight = 0.0;
                              productWidth = 0.0;
                              heightController.text = "";
                              widthController.text = "";
                            });
                          }
                        } else {
                          Get.snackbar(
                              //dismissDirection:,
                              'title',
                              "Error \nfill the fields");
                        }
                      },
                      child: Container(
                        padding: EdgeInsets.only(
                          right: 5.h,
                          left: 5.h,
                        ),
                        decoration: BoxDecoration(
                            color: Color(hexStringToHexInt(
                              ('#235464'),
                            )),
                            border: Border.all(),
                            borderRadius: BorderRadius.circular(5)),
                        width: 125.w,
                        //double.infinity,
                        height: 40.h,
                        child: Center(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Add Product".tr,
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 12,
                                  color: Colors.white,
                                ),
                              ),
                              Icon(
                                Icons.add,
                                size: 30,
                                color: Colors.white,
                              )
                            ],
                          ),
                        ),
                        // ),
                      ),
                    )
                    //  DefualtButton(text: "Add Products", selected: true),
                    ),
              ],
            )
          : CircularProgressIndicator(),
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
//    // vision = FlutterVision();
//     controller = CameraController(cameras[0], ResolutionPreset.high);
//     await controller.initialize();
//    // await loadYoloModel();
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
//   //controller.dispose();
//   //vision.closeYoloModel();
//   super.dispose();
// }

//String employeeId="";
}
