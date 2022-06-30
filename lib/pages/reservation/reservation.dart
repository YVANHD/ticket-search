// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'dart:convert';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:intro_ticket/base/show_custom_navbar.dart';
import 'package:intro_ticket/data/api/api_client.dart';
import 'package:intro_ticket/models/users.dart';
import 'package:intro_ticket/pages/details/details.dart';
import 'package:intro_ticket/pages/places/search_places.dart';
import 'package:intro_ticket/routes/route_helper.dart';
import 'package:intro_ticket/utils/colors.dart';
import 'package:intro_ticket/utils/dimensions.dart';
import 'package:intro_ticket/widget/app_icon.dart';
import 'package:intro_ticket/widget/big_text.dart';
import 'package:intro_ticket/widget/item_reservation.dart';
import 'package:intro_ticket/widget/small_text.dart';

import '../../models/travel_model.dart';

class ReservationTravelPages extends StatelessWidget {


   bool _loading = false;
    var users= <User>[];
    List<Travel> data= <Travel>[];

  ReservationTravelPages({Key? key, required this.data}) : super(key: key);


  @override
  Widget build(BuildContext context) {

    final largeur = MediaQuery.of(context).size.width;
    final longueur = MediaQuery.of(context).size.height;

    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: 180,
            backgroundColor: AppColors.mainColor,
            automaticallyImplyLeading: false,
            toolbarHeight: 90,
            pinned: true,
            title: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    GestureDetector(
                  onTap: () {
                    Get.back();
                  },
                  child: AppIcon(icon: Icons.home)
                ),
                    Expanded(child: Container()),
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
                    Expanded(child: Container()),
                    GestureDetector(
                      onTap: (){
                        
                      },
                      child: AppIcon(icon: Icons.shopping_cart_outlined)
                    )
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
                // decoration: BoxDecoration(
                //   color: Colors.white,
                //   borderRadius: BorderRadius.only(
                //     topRight: Radius.circular(20),
                //     topLeft: Radius.circular(20),
                //   ),
                // ),
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
                    SmallText(text: "${users.length}"),
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
            childCount: data.length,
            (BuildContext context, int i) {
              var travels = data[0];
              var pointers = data[0].journey.points;
              return  data.length == null ? Center(child: Text("Aucun ticket Disponible pour cette recherche")) :
              GestureDetector(
                onTap: () {
                  Get.to(Details(), arguments: {
                    'prix': travels.price,
                    'depart': pointers[0].town,
                    'places': travels.car.place,
                     'heure': travels.hour,
                  });
                },
                child: 
                // ItemReservation(
                //   color: i.isEven ? Colors.teal.shade100 : Colors.blue.shade100,
                //   agency: travels.agence.name,
                //   villeDepart: "7",
                //   villeArrivee: "6",
                //   image: "assets/images/car2.png",
                //   price: travels.price,
                //   title1: "uyu",
                //   title2: "hjh",
                //   arrival: travels.hour,
                //   depart: "1",
                // ),

                Padding(
                  padding: EdgeInsets.only(left: Dimensions.width10, right: Dimensions.width10, top: Dimensions.height10),
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                      width: largeur,
                      height: 120,
                      margin: EdgeInsets.only(right: Dimensions.width10),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(Dimensions.radius30),
                        color: i.isEven ? Colors.red.shade100 : Colors.blue.shade100,
                      ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            FittedBox(
                              fit: BoxFit.scaleDown,
                              child: SmallText(text: travels.agence.name,),
                            ),
                            FittedBox(
                              fit: BoxFit.scaleDown,
                              child: BigText(text:  travels.price,)
                            ),
                          ],
                        ),
                      // SizedBox(height: Dimensions.height10),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                for (var e in pointers)
                                FittedBox(
                                  fit: BoxFit.scaleDown,
                                  child: SmallText(text: e.town)
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
                                  child: BigText(text: e.region),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  ),
                
              );
            },
          ),
        ),
      ],
    ),
    );
  }

    _locationCar() {
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

}