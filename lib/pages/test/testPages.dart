// ignore_for_file: prefer_const_declarations

import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:intro_ticket/data/api/api_client.dart';
import 'package:intro_ticket/models/point.dart';
import 'package:intro_ticket/widget/big_text.dart';
import 'package:intro_ticket/widget/small_text.dart';


class TestPages extends StatefulWidget {
  const TestPages({Key? key}) : super(key: key);

  @override
  State<TestPages> createState() => _TestPagesState();
}

class _TestPagesState extends State<TestPages> {
        late String texte = "yaounde";
        bool _loading = false;
        var points= <Point>[];


    @override
    void initState() {
      _getOrigin();
      super.initState();
    }

    @override
      dispose() {
        super.dispose();
      }


    void  _getOrigin() async {

       await ApiClient().getPoint("users").then((response){
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
            Iterable list = json.decode(response.body);
            points= list.map((model)=>Point.fromJson(model)).toList();
          }
        );
      }).catchError((error) { 
        print(error);
      });
    }
      
        
        // Response response = await http.get(Uri.parse(_url));
        // // print(response.body);

        // List data = jsonDecode(response.body);
        //  print(data.length);
        // setState(() {
        //   data.forEach((element) {
        //   Map point = element;
        //   var street = point['address']['street'];
        //   print(street);
        // });
        // });

      // final String _url = "http://192.168.100.233/api/v1/point/all";
      //   print(_url);
      // return await http.get(
      //   Uri.parse(_url)

      // ).then((response) {

      //   List<dynamic> list = jsonDecode(response.body);
      //       setState(() {
      //         var data = list[0];
              
      //         if (kDebugMode) {
      //           print( data['name']);
      //         }
      //       });     

      //   }).catchError((err) {
      //     print(err);
      //   });

        // var response = await http.get(Uri.parse("http://192.168.100.233/api/v1/point/all"));
        //  if (kDebugMode) {
        //    print(response.body);
        //  }

        // List<dynamic> list = jsonDecode(response.body);
        // var title = list[0]['point']['name'];
        // print("voici un le point $title");

    

  @override
  Widget build(BuildContext context) {
    final largeur = MediaQuery.of(context).size.width;

    //return 
    // SingleChildScrollView(
    //   physics: BouncingScrollPhysics(),
    //   child: Column(
    //     children:[
    //       for(int i = 0; i< 2; i++)

    //         GestureDetector(
    //           child: Padding(
    //             padding: const EdgeInsets.all(2.0),
    //             child: Container(
    //               width: largeur,
    //               height: 40,
    //               padding: EdgeInsets.all(Dimensions.height10/2),
    //               decoration: BoxDecoration(
    //                 borderRadius: BorderRadius.circular(Dimensions.radius15),
    //                 border: Border.all(
    //                   width: 1,
    //                   color: AppColors.mainColor,
    //                 )
    //               ),
    //               child: Text(
    //               texte, 
    //                 textAlign: TextAlign.center,
    //                 style: TextStyle(
    //                   color: AppColors.mainBlackColor
    //                 ),
    //               ),
    //             ),
    //           ),
    //         ),
      
    //     ] 
    
    //   ),
    // );

        return Scaffold(
      appBar: AppBar(
        title: Text(points == null ? 'en cours de chargement ...' : 'Utilisateurs'),
      ),
      body: ListView.separated (
          itemCount: (points == null )? 0 : points.length,
          itemBuilder: (context, index) {
            return ListTile(
              title: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: 
                  [
                    BigText(
                    text: points[index].name,
                  ),
                    SmallText(
                    text: points[index].name,
                  ),
                ],
              ),
            );
          }, separatorBuilder: (BuildContext context, int index) { 
            return Divider(thickness: 1, color: Colors.deepOrange, height: 2);
           },
        ),
      
    );
  }
}