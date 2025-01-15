	
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserServices{
  //methode to store the user name and user email in shared pref
  static Future<void> storeUserDetails(
    {required userName, 
    required String email, 
    required String password, 
    required String confirmPassword, 
    required BuildContext context })async{

      
      //if the users password and confirm password are same then store the users name and emial
      
      try {
        //check weather the user entered password and the confirm password are the same...
      if(password !=confirmPassword){
        //show a message to the user
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text("Password and Confirm password do not match"),
          ),
        );
        return;
      }

        //create an instance from shared preferences
        SharedPreferences pref = await SharedPreferences.getInstance();
        //store the user name and email as key value pairs
        await pref.setString("username", userName);
        await pref.setString("email", email);

        //show a message to the user
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content:Text("User Details stored successful"),
          ),
        );
      } catch (err) {
        err.toString();
      }

    }
}