import 'dart:convert';

import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:intl/intl.dart';
import 'package:intro_ticket/base/show_custom_navbar.dart';
import 'package:intro_ticket/data/api/api_client.dart';
import 'package:intro_ticket/models/point_model.dart';
import 'package:intro_ticket/models/travel_model.dart';
import 'package:intro_ticket/utils/colors.dart';
import 'package:intro_ticket/utils/dimensions.dart';
import 'package:intro_ticket/widget/app_icon.dart';
import 'package:intro_ticket/widget/app_text_field.dart';
import 'package:intro_ticket/widget/big_text.dart';
import 'package:intro_ticket/widget/small_text.dart';


class SearchTravelPages extends StatefulWidget {
  SearchTravelPages({Key? key}) : super(key: key);

  @override
  State<SearchTravelPages> createState() => _SearchTravelPagesState();
}

class _SearchTravelPagesState extends State<SearchTravelPages> {
    DateTime selectedDate = DateTime.now();
    bool _loading = false;
    bool isVisible = true;
    var points= <Points>[];
    List<Travel> travel= <Travel>[];

    late String queryOrigin = "";
    late String queryDestination = '';

    var dateController = TextEditingController();
    var originController = TextEditingController();
    var destinationController = TextEditingController();


    
    @override
    void initState() {
        _loading = false;
      _getOrigin();
      super.initState();
    }

    void _getOrigin() async {
       await ApiClient().getPoint("all").then((response){
          setState(() {
            Iterable list = json.decode(response.body);
               if (kDebugMode) {
                 print(list);
               }
            points= list.map((model)=>Points.fromJson(model)).toList();
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


    
    getResult() async {
       setState(() {
         isVisible = false;
          _loading = true;
        });

      var data = {
          "start_point": "Yaoundé | Mvan",
          "end_point":   "Douala | Akwa", 
          "date":        "07-06-2022",
          "passenger":   "1",
          "nature":      "child"
      };

          var response = await ApiClient().research(data, 'departure/research');
          
          if(response.statusCode == 200 ) {
            Iterable datalist = json.decode(response.body);
              if (kDebugMode) {
                print(datalist);
              }
            travel = datalist.map((model)=>Travel.fromJson(model)).toList();
            
            // _loading = false;
                // setState(() {
                //   Get.to(ReservationTravelPages());
                // });
            setState(() {
              _loading = false;
            });

          //}
        } else {
          showCustomSnackbar("une erreur est survenu", title: "Message");
        }
        

    }



  void _getDatePicker(BuildContext context) async {

    final initialDate = DateTime.now();

    DateTime? pickerDate = await showDatePicker(
      context: context, 
      initialDate: initialDate,
      firstDate: DateTime(initialDate.year - 10), 
      lastDate: DateTime(initialDate.year + 10),
    );

    if(pickerDate != null) {
      setState(() {
          final myFormat = DateFormat('dd-MM-yyyy');
         final selectedDate = myFormat.format(pickerDate);
         print(selectedDate);
      });

    } else {
      print("erreur");
    }

  }


  @override
  Widget build(BuildContext context) {

    final largeur = MediaQuery.of(context).size.width;


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
                         getResult();
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
              height: 280,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(Dimensions.radius30),
                // color: Colors.orange,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(height: Dimensions.height10),
                 SizedBox(
                   width: 290,
                   child: DropdownSearch<String>(
                       items:  List.generate(points.length, (index){
                         var obj = points[index];
                         return obj.town;
                       }),
                       autoValidateMode: AutovalidateMode.onUserInteraction,
                       dropdownSearchDecoration: InputDecoration(
                           labelText: "Départ",
                           hintText: "choisir une ville",
                           filled: true,
                           fillColor:
                               Theme.of(context).inputDecorationTheme.fillColor,
                          border: OutlineInputBorder(
                             borderRadius: BorderRadius.circular(Dimensions.radius20)
                           ),
                           contentPadding: EdgeInsets.symmetric(horizontal: Dimensions.width20, vertical: Dimensions.height20)

                       ),
                       onChanged: (value) {
                         setState(() {
                           queryOrigin = value!;
                           print(queryOrigin);
                         });
                       },
                       selectedItem: queryOrigin,
                         
                   ),
                 ),
                  SizedBox(height: Dimensions.height20),
                  SizedBox(
                    width: 290,
                    child: DropdownSearch<String>(
                        items:  List.generate(points.length, (index){
                          var obj = points[index];
                          return obj.town;
                        }),
                        autoValidateMode: AutovalidateMode.onUserInteraction,
                        dropdownSearchDecoration: InputDecoration(
                            labelText: "Arrivée",
                            hintText: "choisir une ville",
                            filled: true,
                            fillColor:
                                Theme.of(context).inputDecorationTheme.fillColor,
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(Dimensions.radius20)
                            ),
                            contentPadding: EdgeInsets.symmetric(horizontal: Dimensions.width20, vertical: Dimensions.height20)

                        ),
                        onChanged: (value) {
                          setState(() {
                            queryDestination = value!;
                            print(queryDestination);
                          });
                        },
                        selectedItem: queryDestination,
                          
                    ),
                  ),
                  SizedBox(height: Dimensions.height20),
                  GestureDetector(
                    onTap: () {
                       _getDatePicker(context);
                    },
                  child: AppTextField(
                      hintText: selectedDate == null? "": DateFormat('dd-MM-yyyy').format(selectedDate), 
                      //icon: Icons.date_range,
                      widget: IconButton(
                        icon: Icon(Icons.date_range),
                        color: AppColors.mainColor,
                        onPressed: () {
                          
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ),
          // SizedBox(height: Dimensions.height10),
            Container(
              padding: EdgeInsets.symmetric(horizontal: Dimensions.width15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SmallText(text: "Vos Itinéraires"),
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
                          SmallText(text: "Voir", color: AppColors.mainColor,),
                          Icon(
                            Icons.arrow_forward,
                            color: Colors.black,
                            size: 20,
                          ),
                        ],
                      ),
                      onTap: () {
                         //getResult();
                      },
                      
                    ),
                  ),
                ],
              ),
            ),
          SizedBox(height: Dimensions.height20),
          if (isVisible) 
            SizedBox(child: 
              Container(  
                height: 250,
                child: PageView.builder(
                  controller: PageController(viewportFraction: 0.90),
                  itemCount: 2,
                  itemBuilder: (_, i) {
                    return Container(
                    
                      padding: const EdgeInsets.symmetric(horizontal: 10),
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
            ),
            
            SizedBox(child: 
            _loading
            ?
            Center(
              child: Container(
                child: SpinKitThreeBounce(
                  itemBuilder: (BuildContext context, int index) {
                    return DecoratedBox(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: index.isEven ? Color(0xFFC5565C) : Colors.grey,
                      ),
                    );
                  }),
                ),
            )
            :
            Container(  
                height: 250,
                child: PageView.builder(
                  controller: PageController(viewportFraction: 0.90),
                  itemCount: travel.length,
                  itemBuilder: (_, i) {
                    var travels = travel[i];
                    return Container(
                    
                      padding: const EdgeInsets.symmetric(horizontal: 10),
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
                            Column(
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
                                        text: travels.journey.points[0].town,
                                        style: TextStyle(
                                          color: Color.fromARGB(255, 0, 0, 0),
                                          fontSize: Dimensions.font20
                                        ),
                                      ),
                                      TextSpan(
                                        text: travels.journey.points[0].region,
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
                            ),
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
                text: "..........\n",
                style: TextStyle(
                  color: Color.fromARGB(255, 0, 0, 0),
                  fontSize: Dimensions.font20
                ),
              ),
              TextSpan(
                text: "..........\n",
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
                text: "........ \n",
                style: TextStyle(
                  color: Color.fromARGB(255, 0, 0, 0),
                  fontSize: Dimensions.font20
                ),
              ),
              TextSpan(
                text: "........ \n",
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
