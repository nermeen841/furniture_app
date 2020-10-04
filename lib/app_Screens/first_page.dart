import 'dart:math';
import 'package:flutter/material.dart';
import 'package:furniture_app/app_Screens/Category_screens/accessories_Screen.dart';
import 'package:furniture_app/core/design_utils.dart';

class FirstPage extends StatefulWidget {
  @override
  _FirstPageState createState() => _FirstPageState();
}

class _FirstPageState extends State<FirstPage> {


  List<Image> _images= [
    Image.asset('assets/image/sss.jpg', fit: BoxFit.cover,),
    Image.asset( 'assets/image/night-table-lamp-843461_1920.jpg', fit: BoxFit.cover,),
    Image.asset('assets/image/Modern-Vases04.jpg', fit: BoxFit.cover,),
    Image.asset('assets/image/226-2-or-1408125378.jpg', fit: BoxFit.cover,),
  ];

  PageController pageController;
  double viewportFraction = 0.8;
  double pageOffset = 0;

  @override
  void initState() {
    super.initState();
    pageController = PageController(initialPage: 0, viewportFraction: viewportFraction)
      ..addListener(() {
        setState(() {
          pageOffset = pageController.page;
        });
      });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: commenApBar("ALL CATEGORIES", context),
      backgroundColor: HexColor('#A3E7D6'),
      body: PageView.builder(
        controller: pageController,
        itemBuilder: (context, index) {
          double scale = max(viewportFraction, (1 - (pageOffset - index).abs()) + viewportFraction);
          double angle = (pageOffset - index).abs();
          if (angle > 0.5) {
            angle = 1 - angle;
          }
          return InkWell(
            child: Container(
              width: 300,
              padding: EdgeInsets.only(top: 20, right: 10, left: 20, bottom: 80),
              child: Transform(
                transform: Matrix4.identity()
                  ..setEntry(3, 2, 0.001)
                  ..rotateY(angle),
                alignment: Alignment.center,
                child: _images[index],
              ),
            ),
            onTap: (){
              Navigator.push(context, MaterialPageRoute( builder: (context)=> AccessoriesScreen()));
            },
          );
        },
        itemCount: _images.length,
      ),
    );
  }
}
