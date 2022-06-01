// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:intro_ticket/utils/colors.dart';

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
    final Function onTap;

  const ItemReservation({ 
      Key? key, 
      required this.agency, 
      required this.price, 
      required this.image, 
      required this.depart, 
      required this.arrival, 
      required this.onTap, 
      required this.title1, 
      required this.title2, 
      required this.villeDepart, 
      required this.villeArrivee
    }) : super(key: key);


  @override
  Widget build(BuildContext context) {

    final largeur = MediaQuery.of(context).size.width;
    final longueur = MediaQuery.of(context).size.height;

    return GestureDetector(
      onTap: () {
              Navigator.of(context).pushNamed("/detail");
            },
      child: Padding(
      padding: EdgeInsets.only(left: 10, right: 10, top: 10),
      child: Card(
        margin: const EdgeInsets.all(5),
        elevation: 10,
        borderOnForeground: true,
         color: Colors.blue.shade100,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                FittedBox(
                  fit: BoxFit.scaleDown,
                  child: Text(
                    agency,
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ),
                FittedBox(
                  fit: BoxFit.scaleDown,
                  child: Text(
                    price,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 25
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 12),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    FittedBox(
                      fit: BoxFit.scaleDown,
                      child: Text(
                        title1,
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    ),
                    FittedBox(
                      fit: BoxFit.scaleDown,
                      child: Text(
                        title2,
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 12),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    FittedBox(
                      fit: BoxFit.scaleDown,
                      child: Text(
                        depart,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 25
                        ),
                      ),
                    ),
                    _locationCar(),
                    FittedBox(
                      fit: BoxFit.scaleDown,
                      child: Text(
                        arrival,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 25
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 12),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    FittedBox(
                      fit: BoxFit.scaleDown,
                      child: Text(
                        villeDepart,
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    ),
                    FittedBox(
                      fit: BoxFit.scaleDown,
                      child: Text(
                        villeArrivee,
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
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
  }
}

  _itemDepartement(String title1, String depart, String villeDepart) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title1,
            style: TextStyle(
              color: Color.fromARGB(255, 0, 23, 128),
            ),
          ),
          SizedBox(height: 10),
          Text(
            depart,
            style: TextStyle(
              color: Colors.black,
              fontSize: 20,
              fontWeight: FontWeight.bold
            ),
          ),
          SizedBox(height: 10),
          Text(
            villeDepart,
            style: TextStyle(
              color: Color.fromARGB(255, 0, 23, 128),
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
                 size: 10,
              ),
              Icon(
                Icons.fiber_manual_record,
                color: Color.fromARGB(255, 0, 23, 128),
                size: 5,
              ),
              Icon(
                Icons.fiber_manual_record,
                color: Color.fromARGB(255, 0, 23, 128),
                size: 5,
              ),
              Icon(
                Icons.fiber_manual_record,
                color: Color.fromARGB(255, 0, 23, 128),
                size: 5,
              ),
              Icon(
                Icons.fiber_manual_record,
                color: Color.fromARGB(255, 0, 23, 128),
                size: 5,
              ),
              Icon(
                Icons.fiber_manual_record,
                color: Color.fromARGB(255, 0, 23, 128),
                size: 5,
              ),
              Icon(
                Icons.fiber_manual_record,
                color: Color.fromARGB(255, 0, 23, 128),
                size: 5,
              ),
              Icon(
                Icons.fiber_manual_record,
                color: Color.fromARGB(255, 0, 23, 128),
                size: 5,
              ),
              Icon(
                Icons.fiber_manual_record,
                color: Color.fromARGB(255, 0, 23, 128),
                size: 5,
              ),
              SizedBox(width: 5),
              Image.asset('assets/images/car.png', height: 40, width: 40,),
              SizedBox(width: 5),
              Icon(
                Icons.fiber_manual_record,
                color: AppColors.mainColor,
                size: 5,
              ),
              Icon(
                Icons.fiber_manual_record,
               color: AppColors.mainColor,
                size: 5,
              ),
              Icon(
                Icons.fiber_manual_record,
                color: AppColors.mainColor,
                size: 5,
              ),
              Icon(
                Icons.fiber_manual_record,
               color: AppColors.mainColor,
                size: 5,
              ),
              Icon(
                Icons.fiber_manual_record,
                color: AppColors.mainColor,
                size: 5,
              ),
              Icon(
                Icons.fiber_manual_record,
                color: AppColors.mainColor,
                size: 5,
              ),
              Icon(
                Icons.fiber_manual_record,
                color: AppColors.mainColor,
                size: 5,
              ),
              Icon(
                Icons.fiber_manual_record,
                color: AppColors.mainColor,
                size: 5,
              ),
              Icon(
                Icons.blur_circular,
                color: AppColors.mainColor,
                size: 10,
              ),
            ],
          ),
        ],
      ),
    );
  }

  _itemArrival(String title2, String arrival, String villeArrivee) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Text(
            title2,
            style: TextStyle(
              color: AppColors.mainColor,
            ),
          ),
          SizedBox(height: 10),
          Text(
            arrival,
            style: TextStyle(
              color: Colors.black,
              fontSize: 20,
              fontWeight: FontWeight.bold
            ),
          ),
          SizedBox(height: 10),
          Text(
            villeArrivee,
            style: TextStyle(
              color: AppColors.mainColor,
            ),
          ),
        ],
      ),
    );
  }
