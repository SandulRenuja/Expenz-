import 'package:expenz/constant/colors.dart';
import 'package:flutter/material.dart';

class FirstScreen extends StatelessWidget {
  const FirstScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset("assets/images/logo.png",
        width: 150,
        fit: BoxFit.cover,
        ),

        const SizedBox(
          height: 20,
        ),

        const Center(
          child: Text("Expenz",
          style: TextStyle(
            fontSize: 50,
            color: kMainColor,
            fontWeight: FontWeight.bold, 
          ),
        ),
      ),
      
      ],
    );
  }
}