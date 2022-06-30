import 'dart:convert';

import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:intl/intl.dart';
import 'package:get/get.dart';
import 'package:intro_ticket/base/show_custom_navbar.dart';
import 'package:intro_ticket/data/api/api_client.dart';
import 'package:intro_ticket/models/point_model.dart';
import 'package:intro_ticket/models/travel_model.dart';
import 'package:intro_ticket/pages/reservation/reservation.dart';
import 'package:intro_ticket/routes/route_helper.dart';
import 'package:intro_ticket/utils/colors.dart';
import 'package:intro_ticket/utils/dimensions.dart';
import 'package:intro_ticket/widget/app_icon.dart';
import 'package:intro_ticket/widget/app_text_field.dart';
import 'package:intro_ticket/widget/big_text.dart';
import 'package:intro_ticket/widget/item_reservation.dart';
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
        "date":        "27-06-2022",
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
            print(travel.length);
            // var pointers = travel[0].journey.points;
            // for (var e in pointers) {
            //   print(e.name);
            // }

            // _loading = false;
            //     setState(() {
            //       Get.to(ReservationTravelPages());
            //     });
            setState(() {
              _loading = false;
               Get.to(ReservationTravelPages(data: travel));
            });

          //}
        } else {
          showCustomSnackbar("une erreur est survenu", title: "Message");
        }
    }

    getPoints() {

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
                          Get.to(ReservationTravelPages(data: travel));
                          if (kDebugMode) {
                            print("reservation");
                          }
                         //getResult();
                         // Get.toNamed(RouteHelper.reservation, arguments: {travel});
                          // Get.bottomSheet( 
                          //   //_resultTravel(),
                          //   Container(
                          //     decoration: BoxDecoration(
                          //       borderRadius: BorderRadius.circular(Dimensions.radius15),
                          //       border: Border.all(
                          //         color: AppColors.mainColor,
                          //       ),
                          //     ),
                          //   ),
                          //   barrierColor: Colors.transparent,
                          //   elevation: 1,
                          //   isDismissible: true,
                          //   shape: RoundedRectangleBorder(
                          //     borderRadius: BorderRadius.circular(10),
                          //     side: BorderSide(
                          //       color: Colors.white
                          //     )
                          //   ),
                          //   enableDrag: false,
          
                          // );
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
                  controller: PageController(viewportFraction: 0.80),
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
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              _myIconDestination(),
                              SizedBox(width: Dimensions.width45),
                              _myOriginAndDestination(),
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
              SizedBox(  
                height: 250,
                child: PageView.builder(
                  controller: PageController(viewportFraction: 0.90),
                  itemCount: travel.length,
                  itemBuilder: (_, p) {
                  var travels = travel[0];
                  var pointers = travel[0].journey.points;
                  return  travel.length == null 
                    ? 
                  Center(child: Text("Aucun ticket Disponible pour cette recherche"))
                    :
                  GestureDetector(
                    onTap: () {
                      Get.toNamed(RouteHelper.details, arguments: {
                        'prix': travels.price,
                        'depart': pointers[0].town
                      });
                    },
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                        width: largeur,
                        height: 120,
                        margin: EdgeInsets.only(right: Dimensions.width10),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(Dimensions.radius30),
                          color: p.isEven ? Colors.teal.shade100 : Colors.blue.shade100,
                        ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                       mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              FittedBox(
                                 fit: BoxFit.scaleDown,
                                 child: SmallText(text: travels.agence.name,),
                              ),
                              FittedBox(
                                 fit: BoxFit.scaleDown,
                                 child: BigText(text:  travels.price,),
                              ),
                            ],
                          ),
                        // SizedBox(height: Dimensions.height10),
                          SizedBox(
                            height: 120,
                            child: Column(
                              //crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                  children: [
                                    for (var e in pointers) 
                                    FittedBox(
                                      fit: BoxFit.scaleDown,
                                      child: BigText(text: e.town),
                                    ),
                                  ],
                                ),
                                SizedBox(height: Dimensions.height10),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                  children: [
                                    FittedBox(
                                      fit: BoxFit.scaleDown,
                                      child: BigText(text: travels.hour,)
                                    ),
                                    _locationCar(),
                                    FittedBox(
                                      fit: BoxFit.scaleDown,
                                      child: BigText(text: travels.hour,)
                                    ),
                                  ],
                                ),
                                SizedBox(height: Dimensions.height10),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                  children: [
                                    for (var e in pointers) 
                                    FittedBox(
                                      fit: BoxFit.scaleDown,
                                      child: BigText(text: e.address),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
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

Widget _resultTravel() {
     return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: 150,
            backgroundColor: AppColors.mainColor,
            automaticallyImplyLeading: false,
            toolbarHeight: 90,
            pinned: true,
            title: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [

                    Text(
                      "Yaounde",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: Dimensions.font20,
                          fontWeight: FontWeight.bold
                      ),
                    ),
                    SizedBox(width: Dimensions.width10,),
                    Icon(
                      Icons.swap_horiz,
                      color: Colors.white,
                      size: Dimensions.iconSize24,
                    ),
                    SizedBox(width: Dimensions.width10),
                    Text(
                      "Douala",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: Dimensions.font20,
                          fontWeight: FontWeight.bold
                      ),
                    ),
                  ],
                ),
                SizedBox(height: Dimensions.height15),

                Text(
                  "10 Mars 2022",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: Dimensions.font20,
                      fontWeight: FontWeight.bold
                  ),
                ),
              ],
            ),
            bottom: PreferredSize(
              preferredSize: Size.fromHeight(50),
              child: Container(
                color: Colors.white,
                padding: EdgeInsets.symmetric(horizontal: Dimensions.height20, vertical: Dimensions.width10),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(20),
                    topLeft: Radius.circular(20),
                  ),
                ),
                width: double.maxFinite,
                child:Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      onTap: (){
                        Get.defaultDialog(
                          title: "Trier par prix",
                          content: ListTile(
                            title: SmallText(text: "2500")
                          )
                        );
                      },
                      child: AppIcon(icon: Icons.monetization_on)
                    ),
                    SmallText(text: "20"),
                    GestureDetector(
                      onTap: (){
                        Get.defaultDialog(
                          title: "Trier par zone",
                          content: ListTile(
                            title: SmallText(text: "Mvan")
                          )
                        );
                      },
                      child: AppIcon(icon: Icons.filter_list)
                    )
                  ],
                ),
              ),
            ),
            // flexibleSpace: FlexibleSpaceBar(
            //   background: Image.asset(
            //     "assets/images/logo/logo.png",
            //     width: 80,
            //     fit: BoxFit.scaleDown
            //   ),
            // ),
            floating: false,  // Appbar appears immed
          ),

       SliverList(
          delegate: SliverChildBuilderDelegate(
            childCount:3 ,
            (BuildContext context, int i) {
              
              return GestureDetector(
                onTap: () {
                  //Get.to(SearchPlaces());
                },
                child: ItemReservation(
                  color: i.isEven ? Colors.teal.shade100 : Colors.blue.shade100,
                  agency:"agency",
                  villeDepart: "7",
                  villeArrivee: "6",
                  image: "assets/images/car2.png",
                  price: "price",
                  title1: "title1",
                  title2: "title2",
                  arrival: "2",
                  depart: "1",
                ),
              );
            },
          ),
        ),
      ],
    ),
    );
}



  Widget _locationCar() {
    return FittedBox(
      fit: BoxFit.scaleDown,
      child: Column(
        children: [
          Row(
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
              SizedBox(width: Dimensions.width15),
              Image.asset('assets/images/car.png', height: Dimensions.height30, width: Dimensions.width30,),
              SizedBox(width: Dimensions.width15),
              Icon(
                Icons.fiber_manual_record,
                color: AppColors.mainColor,
                size: Dimensions.font20/4,
              ),
              Icon(
                Icons.fiber_manual_record,
               color: AppColors.mainColor,
                size: Dimensions.font20/4,
              ),
              Icon(
                Icons.fiber_manual_record,
                color: AppColors.mainColor,
                size: Dimensions.font20/4,
              ),
              Icon(
                Icons.fiber_manual_record,
                color: AppColors.mainColor,
                size: Dimensions.font20/4,
              ),
              Icon(
                Icons.fiber_manual_record,
                color: AppColors.mainColor,
                size: Dimensions.font20/4,
              ),
              SizedBox(height: Dimensions.height10),
              Icon(
                Icons.blur_circular,
               color: AppColors.mainColor,
                size: Dimensions.font20/2,
              ),
            ],
          ),
        ],
      ),
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
    
      ],
    );
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
