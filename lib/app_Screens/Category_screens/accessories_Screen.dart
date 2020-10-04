import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:furniture_app/core/design_utils.dart';

class AccessoriesScreen extends StatefulWidget {
  @override
  _AccessoriesScreenState createState() => _AccessoriesScreenState();
}

class _AccessoriesScreenState extends State<AccessoriesScreen> {
  PageController pageController;
  double pageOffset = 0;

  @override
  void initState() {
    super.initState();
    pageController = PageController(viewportFraction: 0.8);
    pageController.addListener(() {
      setState(() {
        pageOffset = pageController.page;
      });
    });
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: commenApBar("Accessory Category", context),
      backgroundColor: HexColor('#A3E7D6'),
      body:  Container(
        height: MediaQuery.of(context).size.height * 0.8,
        child: PageView.builder(
          controller: pageController,
          itemBuilder: (context, index) {
            return CardPageWidget(pageOffset - index);
          },
          itemCount: 4,
        ),
      ),
    );
  }
}

class CardPageWidget extends StatelessWidget {


  final double offset;
  CardPageWidget(this.offset);


  @override
  Widget build(BuildContext context) {

    List<Image> _images= [
      Image.asset('assets/image/sss.jpg',  alignment: Alignment( -offset.abs(), 0),
        fit: BoxFit.none,),
      Image.asset('assets/image/2019-03-29_16.04.56.jpg',  alignment: Alignment(-offset.abs(), 0),
        fit: BoxFit.none,),
      Image.asset( 'assets/image/11.jpg',  alignment: Alignment(-offset.abs(), 0),
        fit: BoxFit.none,),
      Image.asset('assets/image/226-2-or-1408125378.jpg', alignment: Alignment(-offset.abs(), 0),
        fit: BoxFit.none,),
    ];

    double gauss = math.exp(-(math.pow((offset.abs() - 0.5), 2) / 0.08));
    return Transform.translate(
      offset: Offset(-32 * gauss * offset.sign, 0),
      child: Card(
        margin: EdgeInsets.only(top: 40, left: 8, right: 8, bottom: 80),
        elevation: 8,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(32)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            ClipRRect(
              borderRadius: BorderRadius.vertical(top: Radius.circular(32)),
              child:  _images[2],
            ),
            SizedBox(height: 8),
            Expanded(
              child: Transform.translate(
                offset:
                Offset(-offset * MediaQuery.of(context).size.width / 2, 0),
                child: Padding(
                  padding: const EdgeInsets.only( left: 15),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Description: ",
                        style: TextStyle(fontSize: 18),
                      ),
                      Text("    1- very comfortable ",
                        style: TextStyle(fontSize: 16),
                        textAlign: TextAlign.center,
                      ),
                      Text("      2- Enable you to relax",
                        style: TextStyle(fontSize: 16),
                        textAlign: TextAlign.center,
                      ),

                      SizedBox(
                        height: 20,
                      ),
                      Text("PRICE: 1500 LE",
                        style: TextStyle(fontSize: 18 , color: Colors.pinkAccent),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                )
              ),
            ),
          ],
        ),
      ),
    );

  }


}