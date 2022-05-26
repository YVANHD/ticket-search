// ignore_for_file: prefer_const_declarations

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:intro_ticket/utils/colors.dart';
import 'package:intro_ticket/utils/dimensions.dart';
import 'package:http/http.dart' as http;


class TestPages extends StatefulWidget {
  const TestPages({Key? key}) : super(key: key);

  @override
  State<TestPages> createState() => _TestPagesState();
}

class _TestPagesState extends State<TestPages> {
        late String texte = "yaounde";
        var data ;



        @override
  void initState() {
    _getOrigin();
    super.initState();
  }

     void  _getOrigin() async {
      final String _url = "http://192.168.100.233/api/v1/point/all";
        print(_url);
      return await http.get(
        Uri.parse(_url)
       
      ).then((response) {
        List<dynamic> list = jsonDecode(response.body);
            setState(() {
                 data = list[0];
                  forEach(data['point'] in data) {
                    print( data['point']['name']); 
                  }

              });     

        }).catchError((err) {
          print(err);
        });
        // var response = await http.get(Uri.parse("http://192.168.100.233/api/v1/point/all"));
        //  if (kDebugMode) {
        //    print(response.body);
        //  }

        // List<dynamic> list = jsonDecode(response.body);
        // var title = list[0]['point']['name'];
        // print("voici un le point $title");
        
      
    }
  @override
  Widget build(BuildContext context) {
    final largeur = MediaQuery.of(context).size.width;

    return SingleChildScrollView(
      physics: BouncingScrollPhysics(),
      child: Column(
        children:[
          for(int i = 0; i< 6; i++)
          GestureDetector(
            child: Padding(
              padding: const EdgeInsets.all(2.0),
              child: Container(
                width: largeur,
                height: 40,
                padding: EdgeInsets.all(Dimensions.height10/2),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(Dimensions.radius15),
                  border: Border.all(
                    width: 1,
                    color: AppColors.mainColor,
                  )
                ),
                child: Text(
                texte, 
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: AppColors.mainBlackColor
                  ),
                ),
              ),
            ),
          ),
      
        ] 
    
      ),
    );
  }
}