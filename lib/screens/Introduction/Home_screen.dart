import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:furniture_app/core/design_utils.dart';
import 'package:furniture_app/screens/Introduction/login_page.dart';
import 'package:furniture_app/screens/Introduction/signup_page.dart';
import 'package:page_transition/page_transition.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Image.asset('assets/image/logo.jpg' , fit: BoxFit.cover, ),
             SizedBox( height: 40),
             InkWell(
               child:  commenButton("LOG IN"),
               onTap: (){
                 Navigator.push(context, PageTransition(
                   type: PageTransitionType.downToUp ,
                   child: LoginPage(),
                   duration: Duration( microseconds: 500)
                 ));
               },
             ),

              SizedBox(
                height: 20,
              ),

              InkWell(
                child:  commenButton("SIGN UP"),
                onTap: (){
                  Navigator.push(context, PageTransition(
                      type: PageTransitionType.downToUp ,
                      child: SignupPage(),
                      duration: Duration( microseconds: 500)
                  ));
                },
              ),

            ],
          ),
        ),
      ),
    );
  }
}
