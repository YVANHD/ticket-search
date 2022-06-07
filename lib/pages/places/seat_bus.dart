import 'package:flutter/material.dart';
import 'package:intro_ticket/models/travel_model.dart';
import 'package:intro_ticket/utils/colors.dart';


class SeatBus extends StatefulWidget {
  final Travel? travel;

  const SeatBus({
    Key? key, this.travel,
  }) : super(key: key);

  @override
  _SeatBusState createState() => _SeatBusState();
}

class _SeatBusState extends State<SeatBus> {

  int? seatSelected;

  List<String> items = [
    "Place 1",
    "Place 2",
    "Place 3",
    "Place 4"
  ];

  @override
  Widget build(BuildContext context) {

    final longueur = MediaQuery.of(context).size.height;
    final largeur = MediaQuery.of(context).size.width;
    return SingleChildScrollView(
      child: Container(
        color:Colors.white,
        height: longueur*0.8,
        width: largeur*0.7,
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
                  child: GridView.count(
                    crossAxisCount: 4,
                    mainAxisSpacing: 1,
                    crossAxisSpacing: 0,
                    padding: EdgeInsets.all(1),
                    ),
                  )
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
    );
  }
}