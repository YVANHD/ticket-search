// ignore_for_file: prefer_const_declarations

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intro_ticket/utils/colors.dart';
import 'package:intro_ticket/utils/dimensions.dart';
import 'package:intro_ticket/widget/app_icon.dart';
import 'package:intro_ticket/widget/big_text.dart';
import 'package:intro_ticket/widget/custom_field.dart';


class TestPages extends StatelessWidget {
   TestPages({Key? key}) : super(key: key);
      
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            automaticallyImplyLeading: false,
            toolbarHeight: 80,
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap: (){
                   
                  },
                  child: AppIcon(icon: Icons.clear)
                ),
                GestureDetector(
                  onTap: (){
                    
                  },
                  child: AppIcon(icon: Icons.shopping_cart_outlined)
                )
              ],
            ),
            bottom: PreferredSize(
              preferredSize: Size.fromHeight(20),
              child: Container(
                // margin: EdgeInsets.symmetric(horizontal: Dimensions.width20),
                
                width: double.maxFinite,
                padding: EdgeInsets.only(top: 5, bottom: 10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(Dimensions.radius20),
                    topRight: Radius.circular(Dimensions.radius20)
                  ),
                  color: Colors.white,
                ),
                child: Center(
                  child: BigText(
                    text: "title", 
                    size: Dimensions.font26
                  )
                ),
              ),
            ),
            pinned: true,
            // backgroundColor: Colors.transparent,
            expandedHeight: 200,
            flexibleSpace: FlexibleSpaceBar(
              background: Image.asset(
                "assets/images/car.png",
                width: double.maxFinite,
                fit: BoxFit.cover,
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(height: Dimensions.height10),
                CustomField(hintText: "Yaounde - Nvam", icon: Icons.car_crash,),
                SizedBox(height: Dimensions.height10),
                CustomField(hintText: "Douala - Boloko", icon: Icons.car_crash,),
                 SizedBox(height: Dimensions.height10),
                CustomField(hintText: "16 Juin 2022", icon: Icons.date_range),
                 SizedBox(height: Dimensions.height10),
                CustomField(hintText: "15h 30", icon: Icons.hourglass_empty,),
                SizedBox(height: Dimensions.height10),
                CustomField(hintText: "1 Personne", icon: Icons.person),
                SizedBox(height: Dimensions.height10),
                CustomField(hintText: "VIP", icon: Icons.class_,),
              ],
            ),
          )
        ],
      ),
      bottomNavigationBar: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            padding: EdgeInsets.symmetric(vertical: Dimensions.height10, horizontal: Dimensions.height10),
            child: BigText(
              text: "continuer", color: Colors.white,
            ),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(Dimensions.radius20/2),
              color: AppColors.mainColor
            ),
          ),
        ],
      ),
    );
  }
}