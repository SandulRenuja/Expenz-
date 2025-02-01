import 'package:expenz/constant/colors.dart';
import 'package:expenz/constant/constant.dart';
import 'package:flutter/material.dart';

class AddnewScreen extends StatefulWidget {
  const AddnewScreen({super.key});

  @override
  State<AddnewScreen> createState() => _AddnewScreenState();
}

class _AddnewScreenState extends State<AddnewScreen> {

  //state track the Expense or Income
  int _selectedMethod = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: _selectedMethod == 0 ? kRed : kGreen,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: kDefalutPadding),
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: kDefalutPadding),
              child: Stack(
                children: [
                  Container(
                    height: MediaQuery.of(context).size.height * 0.07,
                    decoration: BoxDecoration(
                      color: kWhite,
                      borderRadius: BorderRadius.circular(100),
                    ),
                    
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        GestureDetector(
                          onTap:(){
                            setState(() {
                              _selectedMethod = 0;
                            });
                          } ,
                          child: Container(
                            decoration: BoxDecoration(
                              color: _selectedMethod == 0 ? kRed : kWhite,
                              borderRadius: BorderRadius.circular(100),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 60,
                                vertical: 10,
                              ),
                              child: Text("Expense",
                              
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                                color: _selectedMethod == 0 ? kWhite :kBlack, 
                              ),),
                            ),
                          ),
                        ),
                       GestureDetector(
                        onTap: () {
                          setState(() {
                            _selectedMethod = 1;
                          });
                        },
                         child: Container(
                            decoration: BoxDecoration(
                              color: _selectedMethod == 1 ? kGreen :kWhite,
                              borderRadius: BorderRadius.circular(100),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 60,
                                vertical: 10,
                              ),
                              child: Text("Income",
                              
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                                color: _selectedMethod == 1 ? kWhite : kBlack,
                              ),),
                            ),
                          ),
                       ),
                        
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),),
    );
  }
}