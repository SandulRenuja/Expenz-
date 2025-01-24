
import 'package:expenz/services/user_services.dart';
import 'package:expenz/widgets/wrapper.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main()async{

  WidgetsFlutterBinding.ensureInitialized();
  await SharedPreferences.getInstance();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future:UserService.checkUsername(),
          builder: (context, snapshot) {
        //if snap shot is waiting
       if(snapshot.connectionState == ConnectionState.waiting){
        return const CircularProgressIndicator();
       }else{

        //here he hasUserName will be set to true data is their in the snapshot and otherwise false

        bool hasUserName = snapshot.data ?? false;
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            fontFamily: "Inter",
          ),
          home: Wrapper(
            showMainScreen: hasUserName),
        );
       }
        
          
        
      },
      );
  }
}