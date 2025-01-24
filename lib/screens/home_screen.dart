import 'package:expenz/constant/colors.dart';
import 'package:expenz/constant/constant.dart';
import 'package:expenz/services/user_services.dart';
import 'package:expenz/widgets/income_expence.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  //for the store username
  String username ='';

  @override
  void initState() {
    //Get the username from the shared preferences
    UserService.getUserDetails().then((value){
      if(value["username"] != null){
        setState(() {
          username = value["username"]!;
        });
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child:Column(
            children: [
              //bg color col
              Container(
                height: MediaQuery.of(context).size.height * 0.35,
                decoration: BoxDecoration(
                  color: kMainColor.withOpacity(0.15),
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(30),
                    bottomRight: Radius.circular(30),
                  )
                ),
                
                child: Padding(
                  padding: const EdgeInsets.all(kDefalutPadding),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(100),
                              color: kMainColor,
                              border: Border.all(
                                color: kMainColor,
                              ),
                            ),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(100),
                              child: Image.asset("assets/images/user.jpg",
                              width: 50,
                              fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          
                          Text("Welcome $username" ,
                          
                          style: TextStyle(
                            fontSize: 19,
                            fontWeight: FontWeight.w600
                          ),
                        ),
                        SizedBox(width: 20,),
                        IconButton(onPressed: (){}, 
                        icon: Icon(
                          Icons.notifications,
                          color: kMainColor,
                          size: 30,
                        ))
                      ],
                    ),
                    SizedBox(height: 45),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        IncomeExpence(
                          title: "Income",
                           amount: 1500, 
                           imgUrl: "assets/images/income.png", 
                           bgColor: kGreen,
                        ),

                        IncomeExpence(
                          title: "Expense",
                           amount: 800, 
                           imgUrl: "assets/images/expense.png", 
                           bgColor: kRed,
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
          ],
        ) ,
      ),
    ),
  );
  }
}