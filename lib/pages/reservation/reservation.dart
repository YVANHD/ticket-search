// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'dart:convert';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:intro_ticket/base/show_custom_navbar.dart';
import 'package:intro_ticket/data/api/api_client.dart';
import 'package:intro_ticket/models/users.dart';
import 'package:intro_ticket/utils/colors.dart';
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

      @override
      dispose() {
        super.dispose();
      }

      void  _getResult() async {
        setState(() {
          _loading = true;
        });

       await ApiClient().getResult("users").then((response){
         _loading = true;
          setState(() {
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

            if(response.statusCode == 200 ) {
              Iterable list = json.decode(response.body);
              print(list);
              _loading = false;
              users= list.map((model)=>User.fromJson(model)).toList();
            } else {
              showCustomSnackbar("un probleme est survenu", title: "message");
              setState(() {
                _loading = false;
              });
            }
          }
        );
      }).catchError((error) { 
        print(error);
      });
    }

  @override
  Widget build(BuildContext context) {

    final largeur = MediaQuery.of(context).size.width;
    final longueur = MediaQuery.of(context).size.height;

    return _loading 
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
     Scaffold(
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
                      "YDE",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 25,
                          fontWeight: FontWeight.bold
                      ),
                    ),
                    SizedBox(width: 10,),
                    Icon(
                      Icons.swap_horiz,
                      color: Colors.white,
                      size: 25,
                    ),
                    SizedBox(width: 10),
                    Text(
                      "DLA",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 25,
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
                SizedBox(height: 15),

                Text(
                  "10 Mars 2022",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 15,
                      fontWeight: FontWeight.bold
                  ),
                ),
              ],
            ),
            bottom: PreferredSize(
              preferredSize: Size.fromHeight(50),
              child: Container(
                color: Colors.white,
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
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
            childCount: users.length  == null ? 0 : users.length ,
            (BuildContext context, int index) {
              return ItemReservation(
                agency: users[index].name,
                villeDepart: "7",
                villeArrivee: "6",
                image: "assets/images/car2.png",
                onTap: () {},
                price: users[index].address.suite,
                title1: users[index].address.geo.lng,
                title2: users[index].address.geo.lat,
                arrival: "2",
                depart: "1",
              );
            },
          ),
        ),
      ],
    ),
    );
  }

}