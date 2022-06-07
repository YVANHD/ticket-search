// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'dart:convert';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:intro_ticket/base/show_custom_navbar.dart';
import 'package:intro_ticket/data/api/api_client.dart';
import 'package:intro_ticket/models/users.dart';
import 'package:intro_ticket/pages/places/search_places.dart';
import 'package:intro_ticket/utils/colors.dart';
import 'package:intro_ticket/utils/dimensions.dart';
import 'package:intro_ticket/widget/app_icon.dart';
import 'package:intro_ticket/widget/item_reservation.dart';
import 'package:intro_ticket/widget/small_text.dart';

class ReservationTravelPages extends StatefulWidget {
     static String routeName = "/reservation";

  const ReservationTravelPages({ Key? key }) : super(key: key);

  @override
  State<ReservationTravelPages> createState() => _ReservationTravelPagesState();
}

class _ReservationTravelPagesState extends State<ReservationTravelPages> {

   bool _loading = false;
    var users= <User>[];

  @override
  void initState() {
    _getResult();
    super.initState();
     _loading = false;
  }

      void  _getResult() async {
        setState(() {
          _loading = true;
        });

       await ApiClient().getResult("users").then((response){
            if(response.statusCode == 200 ) {
              Iterable list = json.decode(response.body);
              print(list);
              _loading = false;
              users= list.map((model)=>User.fromJson(model)).toList();
               setState(() {
                  _loading = false;
                });
            } else {
              showCustomSnackbar("veuillez patienter ...", title: "message");
            }
           
         // setState(() {
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
          //}
        //);
      }).catchError((error) { 
        print(error);
      });
       setState(() {
          _loading = false;
        });
    }

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
            childCount: users.length ,
            (BuildContext context, int index) {
              var user = users[index];
              return _loading ?
              Container(
                alignment: Alignment.topCenter,
                margin: EdgeInsets.only(top: 20),
                child: CircularProgressIndicator(
                  backgroundColor: Colors.grey,
                  color: AppColors.mainColor,
                )
              )
              :
              GestureDetector(
                onTap: () {
                  Get.to(SearchPlaces());
                },
                child: ItemReservation(
                  agency: user.name,
                  villeDepart: "7",
                  villeArrivee: "6",
                  image: "assets/images/car2.png",
                  price: user.address.suite,
                  title1: user.address.geo.lng,
                  title2: user.address.geo.lat,
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

  

}