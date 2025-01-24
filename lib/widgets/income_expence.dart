import 'package:expenz/constant/colors.dart';
import 'package:expenz/constant/constant.dart';
import 'package:flutter/material.dart';

class IncomeExpence extends StatefulWidget {
  final String title;
  final double amount;
  final String imgUrl;
  final Color bgColor;
  const IncomeExpence({
    super.key, 
    required this.title, 
    required this.amount, 
    required this.imgUrl, 
    required this.bgColor,
    });

  @override
  State<IncomeExpence> createState() => _IncomeExpenceState();
}

class _IncomeExpenceState extends State<IncomeExpence> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.45,
      height: MediaQuery.of(context).size.height * 0.12,
      decoration: BoxDecoration(
        color: widget.bgColor,
        borderRadius: BorderRadius.circular(30),
      ),
      child: Padding(
        padding: const EdgeInsets.all(kDefalutPadding),
        child: Row(
          children: [
            Container(
              height: MediaQuery.of(context).size.height *0.09,
              width: MediaQuery.of(context).size.width *0.15,
              decoration: BoxDecoration(
                color: kWhite,
                borderRadius: BorderRadius.circular(20),
              ),
             child: Center(
              child: Image.asset(
                widget.imgUrl,
                width: 60,
                ),
             ),
            ),
            SizedBox(width: 10,),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(widget.title,
                style: TextStyle(
                  fontSize: 17,
                  color: kWhite,
                  fontWeight: FontWeight.w500,
                ),
                ),

                Text(
                "\$${widget.amount.toStringAsFixed(0)}",
                style: TextStyle(
                  fontSize: 20,
                  color: kWhite,
                  fontWeight: FontWeight.bold,
                ),
                ),
                
              ],
            ),
          ],
        ),
      ),
    );
  }
}