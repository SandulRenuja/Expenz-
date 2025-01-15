import 'package:expenz/constant/colors.dart';
import 'package:expenz/constant/constant.dart';
import 'package:expenz/screens/main_screen.dart';
import 'package:expenz/services/user_services.dart';
import 'package:expenz/widgets/custom_button.dart';
import 'package:flutter/material.dart';

class UserDataScreen extends StatefulWidget {
  const UserDataScreen({super.key});

  @override
  State<UserDataScreen> createState() => _UserDataScreenState();
}

class _UserDataScreenState extends State<UserDataScreen> {

  //for the check box
  bool _rememberMe = false;

  //form key for the form validation
  final _formKey = GlobalKey<FormState>();

  //Controller for the text from feild
  final TextEditingController _userNameController =TextEditingController();
  final TextEditingController _emailController =TextEditingController();
  final TextEditingController _passwordController =TextEditingController();
  final TextEditingController _comfirmPasswordController =TextEditingController();

 @override
  void dispose() {
    _userNameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _comfirmPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(kDefalutPadding),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text("Enter your \nPersonal Details",
                style: TextStyle(
                  fontSize: 35,
                  fontWeight: FontWeight.w500,
                ),
                ),
                const SizedBox(
                  height: 30,
                ),

                //Form 
                Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [

                      //form field for the user Name
                      TextFormField(
                        controller:_userNameController,
                        validator: (value) {
                          //check weather the user enterd avalid user name
                          if(value!.isEmpty){
                            return "Plese Enter your Name";
                          }
                        },
                        decoration: InputDecoration(
                          hintText: "Name",
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15),
                          ),
                          contentPadding: EdgeInsets.all(20),
                        ),
                      ),
                      const SizedBox(
                        height: 24,
                      ),

                      //form field for the user Email
                      TextFormField(
                        controller: _emailController,
                        validator: (value) {
                          if(value!.isEmpty){
                            return "Pleas Enter Your email";
                          }
                        },
                        decoration: InputDecoration(
                          hintText: "Email",
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15),
                          ),
                          contentPadding: EdgeInsets.all(20),
                        ),
                      ),
                      const SizedBox(
                        height: 24,
                      ),

                      //form field for the user password
                      TextFormField(
                        controller: _passwordController,
                        validator: (value) {
                          if(value!.isEmpty){
                            return "Pleas Enter a Valid Password";
                          }
                        },
                        obscureText: true,
                        decoration: InputDecoration(
                          hintText: "Password",
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15),
                          ),
                          contentPadding: EdgeInsets.all(20),
                        ),
                      ),
                      const SizedBox(
                        height: 24,
                      ),

                      //form field for the user Confirm password.0
                      TextFormField(
                        controller: _comfirmPasswordController,
                        validator: (value) {
                          if(value!.isEmpty){
                            return "Pleas Enter the same password";
                          }
                        },
                        obscureText: true,
                        decoration: InputDecoration(
                          hintText: "Confirm Password",
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15),
                          ),
                          contentPadding: EdgeInsets.all(20),
                        ),
                      ),

                      const SizedBox(
                        height: 24,
                      ),

                      //Remember me for the next time
                      Row(
                        children: [
                          const Text("Remember me for the next time",
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                            color: kGrey,
                          ),
                          ),

                          Expanded(
                            child: CheckboxListTile(
                              activeColor: kMainColor,
                              value: _rememberMe, 
                              onChanged: (value) {
                                setState(() {
                                  _rememberMe = value!;
                                  
                                });
                              },
                            ),
                          ),
                        ],
                      ),

                      const SizedBox(
                        height: 24,
                      ),

                      //Submit button
                      GestureDetector(
                        onTap: ()async {
                          if(_formKey.currentState!.validate()){

                            //form is valid, process data
                            String userName = _userNameController.text;
                            String email = _emailController.text;
                            String password = _passwordController.text;
                            String confirmPassword = _comfirmPasswordController.text; 

                            //Save the user name and email in the  device storage
                            await UserServices.storeUserDetails(
                              userName: userName, 
                              email: email, password: 
                              password, confirmPassword: 
                              confirmPassword, 
                              context: context,
                            );

                            //nagigate to the main Screen
                            Navigator.push(context, MaterialPageRoute(
                              builder: (context){
                                return  const MainScreen();
                              })) ; 
                          }
                        },
                        child: CustomButton(
                          buttonName: "Next",
                          buttonColor: kMainColor,
                        ),
                      ),
                    ],
                    
                    
                  )),
              ],
            ),
          ),
        ),
      ),
    );
  }
}