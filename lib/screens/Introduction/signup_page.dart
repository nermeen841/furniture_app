import 'package:flutter/material.dart';
import 'package:furniture_app/app_Screens/first_page.dart';
import 'package:furniture_app/core/design_utils.dart';
import 'package:page_transition/page_transition.dart';

class SignupPage extends StatefulWidget {
  @override
  _SignupPageState createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: commenApBar("SIGN UP" , context),
      body: SingleChildScrollView(
        child: _signupBody( context),
      ),
    );
  }
}

Widget _signupBody( BuildContext context) {
  final _formkey = GlobalKey<FormState>();
  return  Container(
    child: Padding(
      padding: const EdgeInsets.only( top: 30, left: 20 , right: 20 ,),
      child: Form(
        key: _formkey,
        child: Column(
          children: [
            commenTextField( "UserName ", TextInputType.text),
            SizedBox(
              height: 20,
            ),
            commenTextField(" Email" , TextInputType.emailAddress),
            SizedBox(
              height: 20,
            ),
            commenTextField(" Phone Number" , TextInputType.number),
            SizedBox(
              height: 20,
            ),
            commenTextField("Enter Password" , TextInputType.text),
            SizedBox(
              height: 80,
            ),
            InkWell(
              child:  commenButton("SIGN UP"),
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


