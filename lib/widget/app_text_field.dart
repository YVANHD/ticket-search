import 'package:flutter/material.dart';

class AppTextField extends StatelessWidget {
  final TextEditingController? textController;
  final String hintText;
  //final IconData icon;
  bool isObscure;
  final Widget? widget;
  AppTextField({Key? key,

      this.textController,
      required this.hintText,
      //required this.icon,
      this.isObscure=false,
      this.widget
    }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      
      margin:const EdgeInsets.only(left: 20, right: 20),
      decoration: BoxDecoration(
          color: Colors.grey[300],
          borderRadius: BorderRadius.circular(15),
          boxShadow: const [
             BoxShadow(
              color: Colors.grey,
              offset: Offset(4, 4),
              blurRadius: 15,
              spreadRadius: 1,
            ),
             BoxShadow(
              color: Colors.white,
              offset: Offset(-4, -4),
              blurRadius: 15,
              spreadRadius: 1,
            ),
          ]
      ),
      child: TextField(
        
        obscureText: isObscure?true:false,
        textAlign: TextAlign.center,
        enabled: false,
        controller: textController,
        decoration: InputDecoration(
            fillColor: Colors.grey[300],
            filled: true,
            //hintText,
            hintText: hintText,
            // prefixIcon
            // prefixIcon: Icon(icon, color:Color(0xFFC5565C) ),
            prefixIcon: widget == null? Container(): Container(child: widget,),
            //focusedBorder
            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15),
                borderSide: const BorderSide(
                  width: 0.0,
                  color:Colors.white,
                )
            ),
            //enabled Border
            enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15),
                borderSide: const BorderSide(
                  width: 0.0,
                  color:Colors.white,
                )
            ),
            // enabledBorder
            //
            // border
            border:OutlineInputBorder(
              borderRadius: BorderRadius.circular(15),
            ),
            contentPadding: EdgeInsets.symmetric(horizontal: 30, vertical: 10)
        ),
      ),
    );
  }
}