
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
   final String employeeId;
// final List<dynamic>?  clientsId;
final String token;
  const ClientsScreen({super.key,
    // required this.clientsId,
     required this.employeeId,
    required this.token

  });

  @override
  State<ClientsScreen> createState() => _ClientsScreenState();
}

class _ClientsScreenState extends State<ClientsScreen> with TickerProviderStateMixin {

bool isLooding =false;
  @override
  void initState() {
    // TODO: implement initState
  setState(()  {
    fetchClientData(
        widget.token,
      widget.employeeId
    );

  });

    super.initState();
  }
  List<Clients> clients=[];
  Map<String,dynamic>? clientDataMap;
  List<dynamic> clientsDoneDataMap=[];
  List<dynamic>? clientsData;


  Future<List<dynamic>> fetchClientData(
      String token,String employeeId
      ) async {
    final String url = '${baseUrl}/api/client';
    final response = await http.get(
      Uri.parse(url),
      headers: {
        'Authorization': 'Bearer ${token}',
        'Content-Type': 'application/json',
      },
    );
    if (response.statusCode == 200) {
      // Decode the JSON data
      // print(json.decode(response.body)['data']);
      clientsDoneDataMap=json.decode(response.body)['data'];
      print(clientsDoneDataMap![0]['_id']);
      print(clientsDoneDataMap![0]['assignedEmployee']);
setState(() {
  for(int x=0;x<clientsDoneDataMap!.length;x++) {
    clients.add(
        Clients(
            employeeId: clientsDoneDataMap![0]['assignedEmployee'],
            lat: 0.0,
            lang: 0.0,
            clientId: "gjhgjhg",
            //clientsDoneDataMap![x]['clientId'],
            // lang: clientsDoneDataMap![x]['langitute'],
            // lat: clientsDoneDataMap![x]['latitute'],
            name: clientsDoneDataMap![x]["name"],
            address: clientsDoneDataMap![x]["address"],
            phoneNumber: clientsDoneDataMap![x]['phone'],
            email: clientsDoneDataMap![x]['email'],
            profileImage: ""
          //clientsDoneDataMap![x]['profile_image'],
        ));
  }
});
if(clients.isNotEmpty)
  {
    setState(() {
      isLooding=true;
    });

  }
      //print(clientsDoneDataMap.toString());

      //  print( clients[x].);
      // for(int x=0;x<clients.length;x++){
      //         print( clients[x].name);
      //         print(clients[x].address);
      //         print(clients[x].phoneNumber);
      //         print( clients[x].email);
      //        }
      //print(clientsDoneDataMap.toString());

      //      clientsDoneDataMap=json.decode(response.body)['data'];
      //      for(int x=0;x<clientsDoneDataMap!.length;x++) {
      //        clients[x] = Clients(
      //          employeeId: clientsDoneDataMap![x]['assignedEmployee'],
      //          lat: 0.0,
      //          lang: 0.0,
      //          // lang: clientsDoneDataMap![x]['langitute'],
      //          // lat: clientsDoneDataMap![x]['latitute'],
      //          name: clientsDoneDataMap![x]["name"],
      //          address: clientsDoneDataMap![x]["address"],
      //          phoneNumber: clientsDoneDataMap![x]['phone'],
      //          email: clientsDoneDataMap![x]['email'],
      //          profileImage: ""
      //          //clientsDoneDataMap![x]['profile_image'],
      //        );
      //      }
      filterClientsFun(clients,employeeId);
      return json.decode(response.body)['data'];

    } else {
      throw Exception('Failed to load data');
    }
  }
  List<Clients> filteredClients=[];
  void filterClientsFun(List<Clients> allClients,String employeeId){
    for(int p=0;p<allClients.length;p++)
    {
      if(allClients[p].employeeId==employeeId)
      {
        filteredClients.add(allClients[p]);
      }
    }
    for(int i=0;i<clients.length;i++)
      print(clients[i].name);
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
    body:(isLooding==true)?
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
          labelStyle:TextStyle( fontSize: 18,
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
                   itemCount: clients.length,
                   itemBuilder: (context,index){
                     return
                       ClientCard(
                         empolyeeId: widget.employeeId,
                         token: widget.token,
                         clientType: "New",
                         client: clients[index],
                       );
                   }),
               ListView.builder(
                 //shrinkWrap: true,
                   itemCount: clients.length,
                   itemBuilder: (context,index){
                     return
                       ClientCard(
                         empolyeeId: widget.employeeId,
                         token: widget.token,
                         clientType:"Old",
                         client: clients[index],
    );
    }),
    ]
    ))
    ])
    ):
        CircularProgressIndicator()
    );
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
