// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:intro_ticket/utils/colors.dart';
import 'package:intro_ticket/utils/dimensions.dart';
import 'package:intro_ticket/widget/big_text.dart';
import 'package:intro_ticket/widget/small_text.dart';

class ItemReservation extends StatelessWidget {
    final String agency;
    final String title1;
    final String title2;
    final String villeDepart;
    final String villeArrivee;
    final String price;
    final String image;
    final String depart;
    final String arrival;
    final Color? color;

  const ItemReservation({ 
      Key? key, 
      required this.agency, 
      required this.price, 
      required this.image, 
      required this.depart, 
      required this.arrival, 
      required this.title1, 
      required this.title2, 
      required this.villeDepart, 
      required this.villeArrivee,
      this.color = Colors.white,
    }) : super(key: key);


  @override
  Widget build(BuildContext context) {

    final largeur = MediaQuery.of(context).size.width;
    final longueur = MediaQuery.of(context).size.height;

    return 
    Padding(
    padding: EdgeInsets.only(left: Dimensions.width10, right: Dimensions.width10, top: Dimensions.height10),
    child: Container(
      padding: const EdgeInsets.symmetric(horizontal: 10),
        width: largeur,
        height: 120,
        margin: EdgeInsets.only(right: Dimensions.width10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(Dimensions.radius30),
          color: color
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
                child: BigText(text: agency),
              ),
              FittedBox(
                fit: BoxFit.scaleDown,
                child: BigText(text: price,)
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
                  for(int i = 0; i<2; i++)
                  FittedBox(
                    fit: BoxFit.scaleDown,
                    child: SmallText(text: title1)
                  ),
                ],
              ),
              SizedBox(height: Dimensions.height10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  FittedBox(
                    fit: BoxFit.scaleDown,
                    child: BigText(text: depart,)
                  ),
                  _locationCar(),
                  FittedBox(
                    fit: BoxFit.scaleDown,
                    child: BigText(text: arrival,)
                  ),
                ],
              ),
              SizedBox(height: Dimensions.height10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  FittedBox(
                    fit: BoxFit.scaleDown,
                    child: SmallText(text: villeDepart)
                  ),
                  FittedBox(
                    fit: BoxFit.scaleDown,
                    child: SmallText(text: villeArrivee)
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    ),
    );
  }
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

