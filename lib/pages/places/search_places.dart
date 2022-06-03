// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intro_ticket/pages/places/seat_bus.dart';
import 'package:intro_ticket/utils/colors.dart';
import 'package:intro_ticket/utils/dimensions.dart';
import 'package:intro_ticket/widget/app_icon.dart';
import 'package:intro_ticket/widget/big_text.dart';



class SearchPlaces extends StatefulWidget {

  const SearchPlaces({ Key? key }) : super(key: key);

  @override
  State<SearchPlaces> createState() => _SearchPlacesState();
}

class _SearchPlacesState extends State<SearchPlaces> {
  
  @override
  Widget build(BuildContext context) {
    // final DetailsController love = Get.put(DetailsController());

    return Scaffold(
      appBar: AppBar(
        elevation: 5,
        title: BigText(text: "Ticket", textAlign: TextAlign.center,),
      backgroundColor: AppColors.bottonBackgrounColor,
        leading:  GestureDetector(
          onTap: (){
            
          },
          child: AppIcon(icon: Icons.home, size: Dimensions.height10, iconColor: AppColors.iconColor2, )
        )

      ),
      body: SizedBox(
      child:Container(
        padding: EdgeInsets.symmetric(horizontal: Dimensions.width20/2, vertical: Dimensions.height10/2),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            _myInformationDestination(),
            SizedBox(width: Dimensions.width10/2),
            SeatBus()
          ],
        ),
      ),
    ),
      bottomNavigationBar: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // Container(
          //   decoration: BoxDecoration(
          //     color: Colors.white,
          //     borderRadius: BorderRadius.only(
          //       topLeft: Radius.circular(20),
          //       topRight: Radius.circular(20),
          //     ),
          //   ),
          //   child: Row(
          //     mainAxisAlignment: MainAxisAlignment.spaceAround,
          //     children: [
          //       Container(
          //         height: 30,
          //         margin: EdgeInsets.symmetric(vertical: 10),
          //         width: 50,
          //         child: Material(
          //           borderRadius: BorderRadius.circular(20.0),
          //           shadowColor: Color.fromARGB(255, 30, 31, 30),
          //           elevation: 7.0,
          //           child: InkWell(
          //             onTap: () {},
          //             child: Center(
          //               child: Icon(
          //                 Icons.remove,
          //                 size: 20,
          //               ),
          //             ),
          //           ),
          //         ),
          //       ),
          //       Text(
          //         "\02" + " people",
          //         style: TextStyle(
          //           color: Colors.black,
          //           fontSize: 15,
          //           fontWeight: FontWeight.bold
          //         ),
          //       ),
          //       Container(
          //         height: 30,
          //         margin: EdgeInsets.symmetric(vertical: 10),
          //         width: 50,
          //         child: Material(
          //           borderRadius: BorderRadius.circular(20.0),
          //           shadowColor: Color.fromARGB(255, 30, 31, 30),
          //           elevation: 7.0,
          //           child: InkWell(
          //             onTap: () {},
          //             child: Center(
          //               child: Icon(
          //                 Icons.add,
          //                 size: 20,
          //               ),
          //             ),
          //           ),
          //         ),
          //       ),
          //     ],
          //   ),
          // ),
          
          BottomAppBar(
            notchMargin: 0,
            child: Container(
              height: Dimensions.height30 + Dimensions.height30,
              decoration: BoxDecoration(
                color: Colors.grey.shade100,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  InkWell(
                    onTap: () {
                      // love.loveCounter();
                    },
                    child: Center(
                      child: AppIcon(
                        icon: Icons.favorite_border,
                        iconSize: Dimensions.iconSize16,
                        iconColor: AppColors.mainColor
                      )
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      
                    },
                    child: Container(
                      padding: EdgeInsets.all(15),
                      child: BigText(text: "Continue",),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(Dimensions.radius20),
                        color: AppColors.mainColor,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

}

  _myInformationDestination() {
    return SizedBox(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [

          RichText(
            text: TextSpan(
              children: [
                TextSpan(
                  text: "Origine \n",
                  style: TextStyle(
                    color: AppColors.mainColor,
                    fontSize: Dimensions.font20/2
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
                    color: AppColors.mainColor,
                    fontSize: Dimensions.font20/2
                  ),
                ),
              ]
            ),
          ),
          SizedBox(height: Dimensions.height10/2),
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
                    color: AppColors.mainBlackColor,
                    fontSize: Dimensions.font20
                  ),
                ),
                TextSpan(
                  text: "Makepe \n",
                  style: TextStyle(
                    color: AppColors.mainColor,
                    fontSize: Dimensions.font20/2
                  ),
                ),
              ]
            ),
          ),
          SizedBox(height: Dimensions.height10/2),
          RichText(
            text: TextSpan(
              children: [
                TextSpan(
                  text: "Horaire depart \n",
                  style: TextStyle(
                    color: AppColors.mainColor,
                    fontSize: Dimensions.font20/2
                  ),
                ),
                TextSpan(
                  text: "09H 30 \n",
                  style: TextStyle(
                    color: AppColors.mainBlackColor,
                    fontSize: Dimensions.font20
                  ),
                ),
                // TextSpan(
                //   text: "Makepe \n",
                //   style: TextStyle(
                //     color: Color.fromARGB(255, 0, 0, 0),
                //     fontSize: 8
                //   ),
                // ),
              ]
            ),
          ),
          SizedBox(height: Dimensions.height10/2),
          RichText(
            text: TextSpan(
              children: [
                TextSpan(
                  text: "Horaire Destination \n",
                  style: TextStyle(
                    color: AppColors.mainColor,
                    fontSize: Dimensions.font20/2
                  ),
                ),
                TextSpan(
                  text: "15H 30 \n",
                  style: TextStyle(
                    color: AppColors.mainBlackColor,
                    fontSize: Dimensions.font20
                  ),
                ),
                // TextSpan(
                //   text: "Makepe \n",
                //   style: TextStyle(
                //     color: Color.fromARGB(255, 0, 0, 0),
                //     fontSize: 8
                //   ),
                // ),
              ]
            ),
          ),
          SizedBox(height: Dimensions.height10/2),
          RichText(
            text: TextSpan(
              children: [
                TextSpan(
                  text: "Places \n",
                  style: TextStyle(
                   color: AppColors.mainColor,
                    fontSize: Dimensions.font20/2
                  ),
                ),
                TextSpan(
                  text: "02 \n",
                  style: TextStyle(
                    color: AppColors.mainBlackColor,
                    fontSize: Dimensions.font20
                  ),
                ),
                // TextSpan(
                //   text: "Makepe \n",
                //   style: TextStyle(
                //     color: Color.fromARGB(255, 0, 0, 0),
                //     fontSize: 8
                //   ),
                // ),
              ]
            ),
          ),
          SizedBox(height: Dimensions.height10/2),
          RichText(
            text: TextSpan(
              children: [
                TextSpan(
                  text: "Numero \n",
                  style: TextStyle(
                    color: AppColors.mainColor,
                    fontSize: Dimensions.font20/2
                  ),
                ),
                TextSpan(
                  text: "11002120 \n",
                  style: TextStyle(
                    color: AppColors.mainBlackColor,
                    fontSize: Dimensions.font20
                  ),
                ),
                TextSpan(
                  text: "04H \n",
                  style: TextStyle(
                    color: AppColors.mainColor,
                    fontSize: Dimensions.font20/2
                  ),
                ),
              ]
            ),
          ),
        ],
      ),
    );
  }