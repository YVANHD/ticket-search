 import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:intro_ticket/base/show_custom_navbar.dart';
import 'package:intro_ticket/data/api/api_client.dart';
import 'package:intro_ticket/models/point.dart';
import 'package:intro_ticket/routes/route_helper.dart';
import 'package:intro_ticket/utils/colors.dart';
import 'package:intro_ticket/utils/dimensions.dart';
import 'package:intro_ticket/widget/app_icon.dart';
import 'package:intro_ticket/widget/app_text_field.dart';
import 'package:intro_ticket/widget/big_text.dart';
import 'package:intro_ticket/widget/custom_field.dart';
import 'package:intro_ticket/widget/small_text.dart';
import 'package:http/http.dart' as http;


class SearchTravelPages extends StatefulWidget {
  SearchTravelPages({Key? key}) : super(key: key);

  @override
  State<SearchTravelPages> createState() => _SearchTravelPagesState();
}

class _SearchTravelPagesState extends State<SearchTravelPages> {
    DateTime _selectedDate = DateTime.now();
    bool _loading = false;
    var points= <Point>[];

    late String queryOrigin = "";
    late String queryDestination = '';

    var dateController = TextEditingController();


    @override
    void initState() {
      _getOrigin();
      super.initState();
    }

      @override
      dispose() {
        super.dispose();
      }



  void _getDatePicker(BuildContext context) async {

    final initialDate = DateTime.now();

    DateTime? _pickerDate = await showDatePicker(
      context: context, 
      initialDate: initialDate,
      firstDate: DateTime(initialDate.year - 10), 
      lastDate: DateTime(initialDate.year + 10),
    );

    if(_pickerDate != null) {
      setState(() {
         _selectedDate = _pickerDate;
         print(_selectedDate);
      });

    } else {
      print("erreur");
    }

  }


    void _getOrigin() async {

       await ApiClient().getPoint("all").then((response){
         _loading = true;
          setState(() {
            Iterable list = json.decode(response.body);
            points= list.map((model)=>Point.fromJson(model)).toList();
          }
          // List data = json.decode(response.body);
            // if (kDebugMode) {
            //   print(data.length);
            // }
            //   setState(() {
            //       data.forEach((element) {
            //       var point = element;
            //       var name = point['name'];
            //       print(name);
            //     });
            //   }
            //);
        );
      }).catchError((error) { 
        print(error);
      });
    }

  @override
  Widget build(BuildContext context) {

    final largeur = MediaQuery.of(context).size.width;

    void _search() {
        // _timer = Timer.periodic(
        //   Duration(seconds: 2), 
        //   (Timer timer) {
        //     setState(() {
        //       timer.cancel();
        //       StandBye();
        //     });
        //   }
        // );

        if (queryOrigin .isEmpty) {
          showCustomSnackbar("Selectionnez la ville de depart", title: "Message");
        } else if(queryDestination .isEmpty) {
          showCustomSnackbar("Selectionnez la ville d'arrivée", title: "Message");
        } else {
          showCustomSnackbar("Vous recherchez un trajet entre de $queryOrigin et $queryDestination, le $_selectedDate", title: "Message");
        }
        //Get.toNamed(RouteHelper.reservation);
    }

    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        padding: EdgeInsets.only(top: 5),
        // color: Colors.white,
        child: Column(
          children: [
            Container(
             width: largeur,
             height: 80,
             margin: EdgeInsets.only(left: Dimensions.width10, right: Dimensions.width10),
             decoration: BoxDecoration(
               borderRadius: BorderRadius.circular(20),
               color: Colors.blue.shade100,
             ),
             child: Container(
               padding: EdgeInsets.only(left: Dimensions.width10, right: Dimensions.width10),
               child: Row(
                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
                 children: [
                   const CircleAvatar(
                     backgroundColor: Colors.transparent,
                     radius: 30,
                     backgroundImage: const AssetImage(
                       "assets/images/car.png",
                     ),
                   ),
                   // const SizedBox(width: 10),
                   Column(
                     mainAxisAlignment: MainAxisAlignment.center,
                     crossAxisAlignment: CrossAxisAlignment.start,
                     children: [
                       BigText(text: "Bienvenue"),
                       SizedBox(height: Dimensions.height10/2),
                       SmallText(text: "Yvan")
                     ],
                   ),
                  // Expanded(child: Container()),
                  Container(
                     width: 50,
                     height: 50,
                     decoration: BoxDecoration(
                       borderRadius: BorderRadius.circular(20),
                       color: Colors.white,
                     ),
                     child: AppIcon(
                       icon: Icons.notification_add,
                       iconColor: Colors.black,
                       backgroundColor: Colors.white,
                     ),
                  )
                 ],
               ),
             ),
           ),
           SizedBox(height: Dimensions.height20),
            Container(
              padding: EdgeInsets.only(left: Dimensions.width15, right: Dimensions.width15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SmallText(text: "Rechercher un itinéraire"),
                  Container(
                    width: 90,
                    height: 30,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(Dimensions.radius15/3),
                      border: Border.all(
                        width: 1,
                        color: AppColors.mainColor,
                      ),
                    ),
                    child: GestureDetector(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SmallText(text: "Trouver", color: AppColors.mainColor,),
                          Icon(
                            Icons.arrow_forward,
                            color: Colors.black,
                            size: 20,
                          ),
                        ],
                      ),
                      onTap: () {
                         
                         _search();
                      },
                      
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: Dimensions.height20),
            Container(
              padding: EdgeInsets.symmetric(horizontal: Dimensions.width20),
              width: largeur,
              height: 250,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(Dimensions.radius30),
                // color: Colors.orange,
              ),
              child: Column(
                children: [
                  SmallText(text: "Depart", textAlign: TextAlign.center, color: Colors.black,),
                  SizedBox(height: Dimensions.height10),
                  GestureDetector(
                    onTap: () {
                      Get.defaultDialog(
                        title: "Sélectionner une ville",
                        barrierDismissible: true,
                        textConfirm: "continue",
                        // textCancel: "Cancel",
                        content: points.length == null
                        ?
                        Text("Aucune ville disponible", textAlign: TextAlign.center,)
                        :
                        Expanded(
                          child: ListView.separated (
                            itemCount: (points == null )? 0 : points.length,
                            itemBuilder: (context, index) {
                              return points.length == 0 ? CircularProgressIndicator() 
                              : 
                              ListTile(
                                title: GestureDetector(
                                  onTap: () {
                                    if(  points[index].town != "") {
                                      setState(() {
                                        queryOrigin =  points[index].town;
                                        print(queryOrigin);
                                      });
                                    } else {
                                      print("erreur");
                                    }
                                  },
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    children: 
                                    [
                                        BigText(
                                        text: "${points[index].town}",
                                      ),
                                        SmallText(
                                        text: "${points[index].address}",
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            }, separatorBuilder: (BuildContext context, int index) { 
                              return Divider(thickness: 1, color: Colors.deepOrange, height: 2);
                            },
                          ),
                        ),
                      );
                    },
                    child: CustomField(
                      hintText: queryOrigin, 
                      widget: IconButton(
                        icon: Icon(Icons.home),
                        color: AppColors.mainColor,
                        onPressed: () {
                          
                        },
                      ),
                    ),
                  ),
                  SizedBox(height: Dimensions.height10),
                  SmallText(text: "Arrivée", textAlign: TextAlign.center, color: Colors.black,),
                  SizedBox(height: Dimensions.height10),
                  GestureDetector(
                    onTap: () {
                      Get.defaultDialog(
                        title: "Sélectionner une ville",
                        barrierDismissible: true,
                        textConfirm: "continue",
                        // textCancel: "Cancel",
                        content: points.length == null
                        ?
                        Text("Aucune ville disponible", textAlign: TextAlign.center,)
                        :
                        Expanded(
                          child: ListView.separated (
                            itemCount: (points == null )? 0 : points.length,
                            itemBuilder: (context, index) {
                              return points.length == 0 ? CircularProgressIndicator() 
                              : 
                              ListTile(
                                title: GestureDetector(
                                  onTap: () {
                                    if(  points[index].town != "") {
                                      setState(() {
                                        queryDestination =  points[index].town;
                                        print(queryDestination);
                                      });
                                    } else {
                                      print("erreur");
                                    }
                                  },
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    children: 
                                    [
                                        BigText(
                                        text: "${points[index].town}",
                                      ),
                                        SmallText(
                                        text: "${points[index].address}",
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            }, separatorBuilder: (BuildContext context, int index) { 
                              return Divider(thickness: 1, color: Colors.deepOrange, height: 2);
                            },
                          ),
                        ),
                      );
                    },
                    child: CustomField(
                      hintText: queryDestination, 
                      widget: IconButton(
                        icon: Icon(Icons.home),
                        color: AppColors.mainColor,
                        onPressed: () {
                          
                        },
                      ),
                    ),
                  ),
                  SizedBox(height: Dimensions.height10),
                  SmallText(text: "Date", textAlign: TextAlign.center, color: Colors.black,),
                  SizedBox(height: Dimensions.height10),
                  GestureDetector(
                    onTap: () {
                       _getDatePicker(context);
                    },
                    child: AppTextField(
                      textController: dateController, 
                      hintText: DateFormat.yMd().format(_selectedDate), 
                      //icon: Icons.date_range,
                      widget: IconButton(
                        icon: Icon(Icons.date_range),
                        color: AppColors.mainColor,
                        onPressed: () {
                          
                        },
                      ),
                    ),
                  ),
                  SizedBox(height: Dimensions.height10),
                ],
              ),
            ),
          // SizedBox(height: Dimensions.height10),
          Container(
            padding: EdgeInsets.only(left: Dimensions.width15, right: Dimensions.width15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                
                SmallText(text: "Voyages populaires"),
      
                Container(
                  width: Dimensions.width30,
                  height: Dimensions.height20,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(Dimensions.radius15/3),
                    border: Border.all(
                      width: 1,
                      color: AppColors.mainColor,
                    ),
                  ),
                  child: GestureDetector(
                    child: Icon(
                      Icons.arrow_forward,
                      color: Colors.black,
                      size: 15,
                    ),
                    onTap: () {
                      
                    },
                    
                  ),
                )
              ],
            ),
          ),
          SizedBox(height: Dimensions.height20),
          Container(  
              height: 250,
              child: PageView.builder(
                controller: PageController(viewportFraction: 0.90),
                itemCount: 5,
                itemBuilder: (_, i) {
                  return Container(
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    width: largeur,
                    height: 240,
                    margin: EdgeInsets.only(right: Dimensions.width10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(Dimensions.radius30),
                      color: i.isEven ? Colors.teal.shade100 : Colors.blue.shade100,
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Row(
                          children: [
                            _myIconDestination(),
                            SizedBox(width: Dimensions.width45),
                            _myOriginAndDestination(),
                            SizedBox(width: Dimensions.width45),
                            _myOriginAndDestinationIcon(),
                             SizedBox(width: Dimensions.width45),
                              _myIconDestination(),
                          ],
                        )
                      ],
                    ),
                  );
                },
              ),
            ),
            SizedBox(height: Dimensions.height20),
      
          ],
        ),
      )
    );
  }
}



  Widget _myIconDestination() {
    return Column(
     children: [
        Icon(
          Icons.blur_circular,
          color: Color.fromARGB(255, 0, 23, 128),
          size: Dimensions.font20/2,
        ),
        SizedBox(height: Dimensions.height10),
         Icon(
          Icons.fiber_manual_record,
          color: Color.fromARGB(255, 0, 23, 128),
          size: Dimensions.font20/4,
        ),
         Icon(
          Icons.fiber_manual_record,
          color: Color.fromARGB(255, 0, 23, 128),
          size: Dimensions.font20/4,
        ),
         Icon(
          Icons.fiber_manual_record,
          color: Color.fromARGB(255, 0, 23, 128),
          size: Dimensions.font20/4,
        ),
         Icon(
          Icons.fiber_manual_record,
          color: Color.fromARGB(255, 0, 23, 128),
          size: Dimensions.font20/4,
        ),
         Icon(
          Icons.fiber_manual_record,
          color: Color.fromARGB(255, 0, 23, 128),
          size: Dimensions.font20/4,
        ),
        SizedBox(height: Dimensions.height10),
        Image.asset('assets/images/car.png', height: 30, width: 30,),
        SizedBox(height: Dimensions.height10),
        Icon(
          Icons.fiber_manual_record,
          color: Colors.white,
          size: Dimensions.font20/4,
        ),
        Icon(
          Icons.fiber_manual_record,
          color: Colors.white,
          size: Dimensions.font20/4,
        ),
        Icon(
          Icons.fiber_manual_record,
          color: Colors.white,
          size: Dimensions.font20/4,
        ),
        Icon(
          Icons.fiber_manual_record,
          color: Colors.white,
          size: Dimensions.font20/4,
        ),
        Icon(
          Icons.fiber_manual_record,
          color: Colors.white,
          size: Dimensions.font20/4,
        ),
        SizedBox(height: Dimensions.height10),
         Icon(
          Icons.blur_circular,
          color: Colors.white,
          size: Dimensions.font20/2,
        ),
     ],
    );
  }

  Widget _myOriginAndDestination() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        SizedBox(height: Dimensions.height15,),
        RichText(
          text: TextSpan(
            children: [
              TextSpan(
                text: "Départ \n",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 10
                ),
              ),
              TextSpan(
                text: "Yaoundé \n",
                style: TextStyle(
                  color: Color.fromARGB(255, 0, 0, 0),
                  fontSize: Dimensions.font20
                ),
              ),
              TextSpan(
                text: "Mvan \n",
                style: TextStyle(
                  color: Color.fromARGB(255, 0, 0, 0),
                  fontSize: Dimensions.font20/2
                ),
              ),
            ]
          ),
        ),
    
        SizedBox(height: 35,),
    
        RichText(
          text: TextSpan(
            children: [
              TextSpan(
                text: "Destination \n",
                style: TextStyle(
                  color: AppColors.mainColor,
                  fontSize: Dimensions.font20/2
                ),
              ),
              TextSpan(
                text: "Douala \n",
                style: TextStyle(
                  color: Color.fromARGB(255, 0, 0, 0),
                  fontSize: Dimensions.font20
                ),
              ),
              TextSpan(
                text: "Makepe \n",
                style: TextStyle(
                  color: Color.fromARGB(255, 0, 0, 0),
                  fontSize: Dimensions.font20/2
                ),
              ),
            ]
          ),
        ),
      ],
    );
  }

  Widget _myOriginAndDestinationIcon() {
    return FittedBox(
      fit: BoxFit.scaleDown,
      child: Column(
        children: [
          Text(
            "GEY",
            style: TextStyle(
              fontSize: Dimensions.font20,
            ),
          ),
          SizedBox(height: Dimensions.height15,),
          Icon(
            Icons.swap_vert,
            color: Colors.white,
            size: 35,
          ),
          SizedBox(height: Dimensions.height15,),
          Text(
            "GED",
            style: TextStyle(
              fontSize: Dimensions.font20,
            ),
          )
        ],
      ),
    );
}

  
  Widget StandBye() {
    return Container(
      child: SpinKitThreeBounce(
        itemBuilder: (BuildContext context, int index) {
          return DecoratedBox(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: index.isEven ? Color(0xFFC5565C) : Colors.grey,
            ),
          );
        }),
      );
  }
