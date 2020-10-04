import 'package:flutter/material.dart';
import 'package:furniture_app/app_Screens/first_page.dart';
import 'package:furniture_app/core/design_utils.dart';
import 'package:page_transition/page_transition.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: commenApBar(" LOG IN" , context),
     body: _widget( context),
    );
  }
}


Widget _widget( BuildContext context){
  final _formkey = GlobalKey<FormState>();
  return  Container(
      child: Padding(
        padding: const EdgeInsets.only( top: 30 , left: 20 , right: 20 ,),
        child: Form(
          key: _formkey,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              commenTextField("UserName Or Email" , TextInputType.text),
              SizedBox(
                height: 40,
              ),

              commenTextField("Enter Password", TextInputType.text),
              SizedBox(
                height: 40,
              ),
              InkWell(
                child:  commenButton("LOG IN"),
                onTap: (){
                  Navigator.push(context,
                      PageTransition(child: FirstPage(),
                          type: PageTransitionType.leftToRight ,
                          duration: Duration( microseconds: 500)
                      ));
                },
              )

            ],
          ),
        ),
      )
    );

}