// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intro_ticket/utils/colors.dart';
import 'package:intro_ticket/utils/dimensions.dart';
import 'package:intro_ticket/widget/app_icon.dart';
import 'package:intro_ticket/widget/big_text.dart';



class SearchPlaces extends StatelessWidget {

   SearchPlaces({ Key? key,}) : super(key: key);
  
  
  @override
  Widget build(BuildContext context) {
    // final DetailsController love = Get.put(DetailsController());
     final largeur = MediaQuery.of(context).size.width;
      final longueur = MediaQuery.of(context).size.height;
         var seats = int.parse( Get.arguments['places']);


    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
            physics: BouncingScrollPhysics(),
             padding: EdgeInsets.only(top: 5),
            child: Column(
              children: [
                Container(
             width: largeur,
             height: 80,
             margin: EdgeInsets.only(left: Dimensions.width10, right: Dimensions.width10),
             decoration: BoxDecoration(
               borderRadius: BorderRadius.circular(20),
               color: Colors.grey,
             ),
             child: Container(
               padding: EdgeInsets.only(left: Dimensions.width10, right: Dimensions.width10),
               child: Row(
                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
                 children: [
                   GestureDetector(
                    onTap: () => Get.back(),
                     child: Container(
                       width: 50,
                       height: 50,
                       decoration: BoxDecoration(
                         borderRadius: BorderRadius.circular(20),
                         color: Colors.white,
                       ),
                       child: AppIcon(
                         icon: Icons.clear,
                         iconColor: Colors.black,
                         backgroundColor: Colors.white,
                       ),
                                     ),
                   ),
                 BigText(text: "Trouver une place "),
                   // const SizedBox(width: 10),
                  Container(
                     width: 50,
                     height: 50,
                     decoration: BoxDecoration(
                       borderRadius: BorderRadius.circular(20),
                       color: Colors.white,
                     ),
                     child: AppIcon(
                       icon: Icons.shopping_cart_outlined,
                       iconColor: Colors.black,
                       backgroundColor: Colors.white,
                     ),
                  )
                 ],
               ),
             ),
           ),
            SizedBox(height: Dimensions.height20),
                SingleChildScrollView(
                  child: Container(
                    color:Colors.white,
                    height: longueur*0.8,
                    width: largeur*0.8,
                    child: Stack(
                      children: [
                        Column(
                          children: <Widget>[
                            const Spacer(),
                            Container(
                              height: 80,
                              decoration: BoxDecoration(
                                borderRadius: const BorderRadius.all(
                                    Radius.circular(20)
                                ),
                                color: Colors.blue,
                                border: Border.all(
                                  color: Colors.black,
                                  width: 2,
                                ),
                              ),
                            ),
                            const Spacer(flex: 1),
                            Container(
                              height: 80,
                              decoration: BoxDecoration(
                                borderRadius: const BorderRadius.all(
                                    Radius.circular(20)
                                ),
                                color: Colors.blue,
                                border: Border.all(
                                  color: Colors.black,
                                  width: 2,
                                ),
                              ),
                            ),
                            const Spacer(),
                          ],
                        ),
                        Container(
                          margin: const EdgeInsets.all(8),
                          decoration: BoxDecoration(
                            color: Colors.grey,
                            borderRadius: const BorderRadius.all(
                              Radius.circular(40),
                            ),
                            border: Border.all(
                              color: Colors.black,
                              width: 2,
                            ),
                          ),
                          child: ClipRRect(
                            borderRadius: const BorderRadius.all(
                              Radius.circular(40),
                            ),
                            // child: GridView.count(
                            //   crossAxisCount: 4,
                            //   mainAxisSpacing: 0,
                            //   crossAxisSpacing: 0,
                            //   children: []
                              // travel!.seats!
                              //     .asMap()
                              //     .map((index, element) {
                              //   return MapEntry(
                              //       index,
                              //       InkWell(
                              //         onTap: () {
                              //           setState(() {
                              //             seatSelected = index;
                              //           });
                              //         },
                              //         child: Image.asset(
                              //             'assets/images/seats/seat_3.jpg',
                              //           width: 10,
                              //         ),
                              //       ),
                              //   );
                              // })
                              //   .values.toList()
                              child:  GridView.count(
                                crossAxisCount: 4,
                                mainAxisSpacing: 1,
                                crossAxisSpacing: 0,
                                padding: EdgeInsets.all(1),
                                shrinkWrap: true,
                                children: List.generate(seats, (index) {
                                    return Padding(
                                      padding: const EdgeInsets.all(10.0),
                                      child: Container(
                                        decoration: BoxDecoration(
                                          image: DecorationImage(
                                            image: AssetImage("assets/images/seats/seat_2.png"),
                                            fit: BoxFit.cover,
                                          ),
                                          borderRadius:
                                          BorderRadius.all(Radius.circular(10),),
                                        ),
                                      ),
                                    );
                                  },
                                ),
                              )
                            ),
                          ),
                        ],
                    ),
                    // Container(height: 10,),
                    //   Container(
                    //     padding: EdgeInsets.all(5),
                    //     decoration: BoxDecoration(
                    //       border: Border.all(
                    //         color: Colors.blue.shade100,
                    //         width: 2,
                    //       ),
                    //       borderRadius: BorderRadius.circular(5),
                    //     ),
                    //     child: Container(),
                    //   )

                  ),
                ),
              ],
            )
          ),

      bottomNavigationBar: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          BottomAppBar(
            notchMargin: 0,
            child: Container(
              height: Dimensions.height30 + Dimensions.height30,
              decoration: BoxDecoration(
                color: Colors.grey.shade100,
              ),
              child: GestureDetector(
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
            ),
          ),
        ],
      ),
    );
  }


}
