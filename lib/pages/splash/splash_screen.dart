import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intro_ticket/routes/route_helper.dart';
import 'package:intro_ticket/utils/dimensions.dart';
import 'package:intro_ticket/utils/colors.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> with TickerProviderStateMixin{
      late Animation <double> animation;
  late AnimationController controller;

  @override
  void initState() {
    super.initState();
    _loadResource();
    controller =  AnimationController(
      vsync: this, 
      duration: Duration(seconds: 3)
    ).. forward();

    animation = CurvedAnimation(
      parent: controller, 
      curve: Curves.linear
    );

    Timer(
      const Duration(seconds: 3),
      () =>  Get.offNamed(RouteHelper.getInitial()),
    );
  }

   Future<void> _loadResource() async {
     
   }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.mainColor,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ScaleTransition(
            scale: animation,
            child: Center(
              child: Image.asset(
                "assets/images/logo/logo.png",
                fit: BoxFit.fitHeight,
                width: Dimensions.splashImg,
              )
            ),
          )
        ],
      ),
    );
  }
}