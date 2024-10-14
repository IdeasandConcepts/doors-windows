
import 'package:doorsandwindows/model/model.dart';
import 'package:doorsandwindows/src/components/consts.dart';
import 'package:doorsandwindows/src/widgets/clients/client_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'dart:convert';
import 'package:doorsandwindows/model/client.dart';
import 'package:http/http.dart' as http;


class ClientsScreen extends StatefulWidget {
//   final String employeeId;
// final List<dynamic>?  clientsId;
  const ClientsScreen({Key? key,
    // required this.clientsId,
    // required this.employeeId,


  }) : super(key: key);

  @override
  State<ClientsScreen> createState() => _ClientsScreenState();
}

class _ClientsScreenState extends State<ClientsScreen> with TickerProviderStateMixin {

@override
  void initState() {
   readClients(
      // widget.clientsId!
   );
    super.initState();
  }
  Clients? client;
  List<Clients> clients=[];
  Map<String,dynamic>? dataMap;
  Map<String,dynamic>? doneDataMap;
  List<dynamic>? data;

  Future readClients (
     // List<dynamic>? clientsId
      ) async {
    // final body = json.encode({
    //   "employeeId":clientsId
    // });
    http.Response response = await http.post(
      Uri.parse('${{baseUrl}}/api/client'),

      headers: {"Content-Type": "application/json"},
      //body: body,
    );
    // http.Response response ;
    // response= await http.get(Uri.parse('${baseUrl}/api/auth/login'));


    if(response.statusCode==200)
    {
      dataMap=jsonDecode(response.body);
      doneDataMap=dataMap!['data']; /// for single data
print(jsonDecode(response.body).toString());
      // client=Clients(
      //   employeeId:doneDataMap!['employee_id'],
      //   lang: doneDataMap!['langitute'],
      //   lat: doneDataMap!['latitute'],
      //   name: doneDataMap!["name"],
      //   address:doneDataMap!["address"],
      //   phoneNumber: doneDataMap!['phone_number'],
      //   email: doneDataMap!['email'],
      //   profileImage: doneDataMap!['profile_image'],
      // );
      // data =dataMap!['data']; /// for list of data
      // for(int x=0;x<data!.length;x++)
      //   clients[x]=Clients(
      //     employeeId:doneDataMap!['employee_id'],
      //     lang: data![x]['langitute'],
      //     lat:data![x]['latitute'],
      //     name:data![x]["name"],
      //     address:data![x]["address"],
      //     phoneNumber:data![x]['phone_number'],
      //     email:data![x]['email'],
      //     profileImage:data![x]['profile_image'],
      //   );
    }
  }

  TextEditingController clientController=TextEditingController();
int selectedTab=0;
  List<String>clientTypes=["New","Old"];

  @override
  Widget build(BuildContext context) {
    TabController tabController =TabController(length: 2, vsync: this);
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
               automaticallyImplyLeading: false,
      backgroundColor: kprimaryColor,
leading:   IconButton(
    onPressed: () {
  Get.defaultDialog();
},
    icon:Icon( Icons.menu,color: Colors.white,)),
      actions:
          [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: const Icon(
              Icons.timer_sharp,
              color: Colors.white,
              size: 30,
            ),
          ),
    ]

      ),
    body:
      Container(
        height: MediaQuery.of(context).size.height*2,
        child: Column(
          children: [
            SizedBox(height: 10,),
        Container(height: 40,
        child: TabBar(
          controller: tabController,
          indicatorColor: kprimaryColor,
          onTap: update(tabController.index),
          labelStyle:  TextStyle( fontSize: 18,
            color:Colors.white
          ),
          labelColor: kprimaryColor,
          unselectedLabelColor: Color(hexStringToHexInt(
            ('#403F3F'),
          )),
          tabs: [
            Container(
              padding: EdgeInsets.only(
                  left: 20.w,right: 20.w,top: 10.h),
                width:200.w,
                height: 40.h,
                decoration: BoxDecoration(
                  color:(isSelected==true) ?kprimaryColor:Colors.transparent,
                 // border: Border.all(),
                  borderRadius: BorderRadius.circular(4)
                ),
                child: Text("New Clients".tr,
                )),
        Container(
          padding: EdgeInsets.only(left: 20.w,right: 20.w,top: 10.h),
          width:200.w,
          height: 40.h,
          decoration: BoxDecoration(
            //color: kprimaryColor,
             // border: Border.all(),
              borderRadius: BorderRadius.circular(4)
          ),
            child:
            Text("Old Clients"),
        )],
        ),
        ),
            Padding(
                padding: const EdgeInsets.all(10),
                child: Material(
                  elevation: 10,
                  borderRadius: BorderRadius.all(Radius.circular(10.r)),
                  child: Container(
                    width: 340.w,
                    height: 40.h,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        color: const Color(0xffEAE9E9),
                        borderRadius: BorderRadius.all(
                            Radius.circular(4.r))),
                    child: TextField(
                      controller: clientController,
                      decoration: InputDecoration(
                        //labelText: 'search',
                        //label: Text('get'),
                        hintText: "search for a client".tr,
                        hintStyle:
                        TextStyle(fontWeight: FontWeight.w400, fontSize: 14.sp),
                        prefixIcon: const Icon(Icons.search_sharp),
                        border: InputBorder.none,
                      ),
                      onChanged: (value){
                        setState(() {
                        });
                      },
                      onSubmitted: (newValue){
                        setState(() {
                        });
                      },
                    ),
                  ),)
            ),
        Container(
          height:MediaQuery.of(context).size.height-250,
            child:
            TabBarView(
              controller: tabController,
             children: [
               ListView.builder(
                 //shrinkWrap: true,
                   itemCount: clientData.length,
                   itemBuilder: (context,index){
                     return
                       ClientCard(
                         clientType: "New",
                         client: clientData[index],
                       );
                   }),
               ListView.builder(
                 //shrinkWrap: true,
                   itemCount: clientData.length-2,
                   itemBuilder: (context,index){
                     return
                       ClientCard(
                         clientType:"Old",
                         client: clientData[index],
    );
    }),
    ]
    ))
    ])
    ));
  }
  hexStringToHexInt(String hex) {
    hex = hex.replaceFirst('#', '');
    hex = hex.length == 6 ? 'ff' + hex : hex;
    int val = int.parse(hex, radix: 16);
    return val;
  }
bool isSelected=false;
  update(int index) {
    setState(() {
      print(index);
      if(index==clientTypes[index])
        isSelected=true;
     // selectedTab=index;
    });
  }
}
