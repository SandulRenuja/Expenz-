import 'package:expenz/constant/colors.dart';
import 'package:expenz/constant/constant.dart';
import 'package:flutter/material.dart';

class SharedOnbordingScreen extends StatelessWidget {

  final String title;
  final String imagePath;
  final String description;

  const SharedOnbordingScreen({
    super.key, 
    required this.title, 
    required this.imagePath, 
    required this.description,
    });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(kDefalutPadding),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            imagePath ,
             width: 300,
             fit: BoxFit.cover,
          ),
      
         const SizedBox(
            height: 20,
          ),
      
          Text(
            title,
            style: TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.w500,
          ),
          ),
          Text(
            description,
            style: TextStyle(
              color: kGrey,
            fontSize: 18,
          ),
          ),
        ],
      ),
    );
  }
}