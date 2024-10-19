
import 'package:doorsandwindows/model/client.dart';
import 'package:doorsandwindows/model/request.dart';
import 'package:doorsandwindows/src/screens/orders/orders_list.dart';
import 'package:doorsandwindows/src/screens/products/add_product_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:geolocator/geolocator.dart';
import 'package:url_launcher/url_launcher.dart';

class ClientCard extends StatefulWidget {
 final String empolyeeId;
  final String token;
  final Clients client;
  final String clientType;
  const ClientCard({super.key, required this.client,

    required this.clientType, required this.empolyeeId, required this.token});

  @override
  State<ClientCard> createState() => _ClientCardState();


}

class _ClientCardState extends State<ClientCard> {
  static void navigateTo(double lat, double lng) async {
    try{
      var uri = Uri.parse("google.navigation:q=$lat,$lng&mode=d");
      //  if (await canLaunch(uri.toString())) {
      await launch(uri.toString());
      // } else {
      // throw 'Could not launch ${uri.toString()}';
      // }
    }catch(e){
      throw "Could not launch "+e.toString();
    }
    // try(){}catch(e){
    //
    // }

  }
  //LocaleAndThemeController controller = Get.put(LocaleAndThemeController());
 // MyServices myServices = Get.find();
  String? sharedlang;
  @override
  void initState() {
   // _handleLocationPermission();

    // TODO: implement initState
  // sharedlang = myServices.sharedPreferences.getString("lang");
    // dateFormat=DateFormat('EEEE').format(dt1);
    // print(dateFormat);
    print(sharedlang);
  }
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left:10.0,right: 10.0,top: 5.0),
      child: Container(
        height: 200,
        decoration: BoxDecoration(
          border: Border.all(),
          borderRadius: BorderRadius.circular(4),
          color: Colors.white,
        ),
        child: Row(
          //mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
        Padding(
          padding: const EdgeInsets.only(left:5.0,right: 5.0),
          child: Container(
           // color: kprimaryColor,
            height: 200,
            width: 150,
            child: Column(

              children: [

                Container(
                  width:150,
               //   height: 10,
                  child: Card(

                    child:  Column(
                    children: [
                      Container(
                        width:120,
                       height: 120,
                       // child:
                        //Padding(
                          padding: const EdgeInsets.all(10.0
                          ),
                          child: ClipOval(
                            clipBehavior: Clip.antiAlias,
                            //  clipBehavior: Clip.hardEdge,
                            child: Material(
                              borderOnForeground: true,
                              color: Colors.black,
                              child: Ink.image(
                                image: AssetImage("assets/images/profile.png",
                                ),
                                 fit: BoxFit.cover,
                                height: 100.h,
                                width: 100.h,
                              ),
                            ),
                          ),
                       // ),
                      ),

                      GestureDetector(
                        onTap: (){
                          navigateTo(0.0, 0.0);
                        },
                        child: Text("View Location",

                            style: TextStyle(
                                decoration: TextDecoration.underline,
                                color:Color(hexStringToHexInt(('#0D31A7'),))
                            )),
                      ),



                    ],
                  ),
                  ),
                ),
                Padding(
                    padding: const EdgeInsets.only(
                        top:5.0,bottom: 5.0,left: 5.0,right: 5.0),
                    child:
                    GestureDetector(
                      onTap: (){
                        if(widget.clientType=="New")
                        Get.to(()=>AddProductsScreen(
                          selectedClient: widget.client,
                          employeeId: widget.empolyeeId,
                          token: widget.token,
                        ));
                        else if(widget.clientType=="Old")
                          {
                          Get.to(()=>OrdersListScreen(
                            order: userCartRequests[0],
                              selectedClient: widget.client,
                              token: widget.token,
                              employeeId: widget.empolyeeId)
                          );
                          }
                      },
                      child: Container(
                        padding: EdgeInsets.only(
                            right: 5.h,left: 5.h,),
                        decoration: BoxDecoration(
                            color:Color(hexStringToHexInt((widget.clientType=="New")?('#1C3DED'):("#3EA1C3"),)),
                            border:Border.all(),
                            borderRadius: BorderRadius.circular(5)),
                        width: double.infinity,
                        height: 32.h,
                        child: Center(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                (widget.clientType=="New")? "Add Products".tr:"Edit Products".tr,
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 12,
                                  color: Colors.white,
                                ),
                              ),
                              Icon(  (widget.clientType=="New")?
                                Icons.add:Icons.edit_note,
                              size: 30,color: Colors.white,
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
        ),
            Padding(
              padding: const EdgeInsets.only(left:5.0,
                  right: 5.0),
              child: Container(
                color: Colors.white,
                height: 220,
                width: 190,
                child: ListView(
                  shrinkWrap: true,
                  // controller: _scrollController,
                  children: [
                    buildField(widget.client.name,40),
                    buildField(widget.client.address,50),
                    buildField(widget.client.phoneNumber,40),
                    buildField(widget.client.email,40),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildField(String fieldName,double hieght){
    return   Padding(
      padding:  EdgeInsets.only(top:4.h,right: 5.h,left: 5.h,bottom: 1.h),
      child: Container(
          padding: EdgeInsets.only(
          top:5.h,right: 5.h,left: 5.h,bottom: 10.h),
      decoration: BoxDecoration(
      border:Border.all(),
      borderRadius: BorderRadius.circular(4)),
       width: 60,
      height: hieght,
      child:
      Text(
                fieldName.tr,
                style: TextStyle(
                    color: Colors.black,
                   // fontWeight: FontWeight.bold,
                    fontSize: 14),
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

  // Future<Position> _handleLocationPermission() async {
  //   bool serviceEnabled;
  //   LocationPermission permission;
  //
  //   serviceEnabled = await Geolocator.isLocationServiceEnabled();
  //   if (!serviceEnabled) {
  //     await Geolocator.openLocationSettings();
  //     ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
  //         content: Text('Location services are disabled. Please enable the services')));
  //     //return false;
  //   }
  //   permission = await Geolocator.checkPermission();
  //   if (permission == LocationPermission.denied) {
  //     permission = await Geolocator.requestPermission();
  //     if (permission == LocationPermission.denied) {
  //       ScaffoldMessenger.of(context).showSnackBar(
  //           const SnackBar(content: Text('Location permissions are denied')));
  //       //return false;
  //     }
  //   }
  //   if (permission == LocationPermission.deniedForever) {
  //     ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
  //         content: Text('Location permissions are permanently denied, we cannot request permissions.')));
  //     //return false;
  //   }
  //   return await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
  // }
}
