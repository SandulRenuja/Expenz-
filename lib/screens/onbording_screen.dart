import 'package:expenz/constant/colors.dart';
import 'package:expenz/data/onbording_data.dart';
import 'package:expenz/screens/onbording/first_screen.dart';
import 'package:expenz/screens/onbording/shared_onbording_screen.dart';
import 'package:expenz/screens/user_data_screen.dart';
import 'package:expenz/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';


class OnbordingScreen extends StatefulWidget {
  const OnbordingScreen({super.key});

  @override
  State<OnbordingScreen> createState() => _OnbordingScreenState();
}

class _OnbordingScreenState extends State<OnbordingScreen> {
  //page conteoller
  final PageController  _controller = PageController();
  bool showDetailPage = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: Stack(
              children: [
                //Onbording Screens
                PageView(
                  controller: _controller,
                  onPageChanged: (index) {
                    setState(() {
                      showDetailPage = index == 3;
                    });
                  },
                  children: [
                    const FirstScreen(),
                    SharedOnbordingScreen(
                      title: OnbordingData.onbordingDataList[0].title, 
                      imagePath:OnbordingData.onbordingDataList[0].imagePath, 
                      description: OnbordingData.onbordingDataList[0].description,
                    ),

                     SharedOnbordingScreen(
                      title: OnbordingData.onbordingDataList[1].title, 
                      imagePath:OnbordingData.onbordingDataList[1].imagePath, 
                      description: OnbordingData.onbordingDataList[1].description,
                    ),

                     SharedOnbordingScreen(
                      title: OnbordingData.onbordingDataList[2].title, 
                      imagePath:OnbordingData.onbordingDataList[2].imagePath, 
                      description: OnbordingData.onbordingDataList[2].description,
                    ), 
                  ],
                ),

                //page dot indicaters
                Container(
                  alignment: const Alignment(0, 0.75),
                  child:SmoothPageIndicator(
                    controller: _controller,
                    count: 4,
                    effect:const WormEffect(
                      activeDotColor: kMainColor,
                      dotColor: kLightGrey,
                    ),

                  ),
                  
                ),

                //navigation button
                Positioned(
                  bottom: 20,
                  left: 0,
                  right: 0,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 30),
                    child:! showDetailPage ? GestureDetector(
                      onTap: (){
                        _controller.animateToPage(
                          _controller.page!.toInt() + 1,
                          duration: const Duration(milliseconds: 500), 
                          curve: Curves.easeInOut,);
                      },
                      child: CustomButton(
                        buttonName: showDetailPage ? "Get Started"  : "Next",
                        buttonColor: kMainColor,
                      ),
                    ):
                    GestureDetector(
                      onTap: (){
                       //Navigate to the user data screen
                       Navigator.push(context, MaterialPageRoute(builder: (context) =>const UserDataScreen() ,));
                      },
                      child: CustomButton(
                        buttonName: showDetailPage ? "Get Started"  : "Next",
                        buttonColor: kMainColor,
                      ),
                    )
                  ),),
              ],
            ),
          ),
        ],
      ),
    );
  }
}