import 'package:flutter/material.dart';

class AppIcon extends StatelessWidget {
  
  final IconData icon;
  final Color backgroundColor;
  final Color iconColor;
  final double size;
  final double iconSize;

  const AppIcon({ 
    Key? key, 
    required this.icon, 
    this.backgroundColor = const Color.fromARGB(255, 255, 255, 255), 
    this.iconColor = const Color.fromARGB(255, 0, 0, 0),  
    this.size = 40,
    this.iconSize = 18
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(size /2),
        color: backgroundColor,
      ),
      child: Icon(
        icon,
        color: iconColor,
        size: iconSize,
      ) 
    );
  }
}