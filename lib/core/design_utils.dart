
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class HexColor extends Color {
  static int _getColorFromHex(String hexColor) {
    hexColor = hexColor.toUpperCase().replaceAll("#", "");
    if (hexColor.length == 6) {
      hexColor = "FF" + hexColor;
    }
    return int.parse(hexColor, radix: 16);
  }

  HexColor(final String hexColor) : super(_getColorFromHex(hexColor));
}

// ignore: non_constant_identifier_names
Widget Main_text(String txt,
    {FontWeight fontWeight, Color color, double size, double fonthight}) {
  return Text(
    txt,
    overflow: TextOverflow.ellipsis,
    style: TextStyle(
        fontWeight: fontWeight ?? FontWeight.w500,
        height: fonthight ?? 1,
        fontSize: size ?? 15,
        color: color ?? Colors.black),
  );
}

// ignore: non_constant_identifier_names
Widget Loading() {
  return Center(
    child: CupertinoActivityIndicator(
      radius: 17,
      animating: true,
    ),
  );
}





card_container(Widget childd, double width, color , context) {
  return Container(
    width: width,
    // height: MediaQuery.of(context).size.height * .15,
    padding: EdgeInsets.only(right: 15, left: 15, top: 20, bottom: 20),
    child: childd,
    margin: EdgeInsets.all(8),
    decoration: BoxDecoration(
      color: color,
      borderRadius: BorderRadius.circular(15),
      boxShadow: [
        BoxShadow(
          color: Colors.grey.withOpacity(0.5),
          spreadRadius: 1,
          blurRadius: 2,
          offset: Offset(0, 3), // changes position of shadow
        ),
      ],
    ),
  );
}


commenApBar( String txt , BuildContext context){
  return  AppBar(
    title: Text( txt , style: TextStyle(color: Colors.black , fontSize: 14, fontWeight: FontWeight.w600),),
    centerTitle: true,
    backgroundColor: Colors.transparent,
    elevation: 0.0,
    leading: IconButton(
      icon: Icon( Icons.arrow_back , color: Colors.black,),
      onPressed: (){
        Navigator.pop(context);
      },),
  );
}



commenTextField( String txt , key ){
  return TextFormField(
    keyboardType: key,
    decoration: InputDecoration(
      hintText: txt,
      hintStyle: TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.w400,
      )
    ),
    validator: ( value){
      if( value.isEmpty){
        return "this field is required";
      }
      else{
        return null;
      }
    },
  );
}

commenButton(String txt){
  return Container(
    width: 308,
    height: 50,
    child: Padding(
      padding: const EdgeInsets.only( top: 15),
      child: Text( txt ,
        style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w600,
            color: Colors.black
        ),
        textAlign: TextAlign.center,
      ),
    ),
    decoration: BoxDecoration(
      color: HexColor('#A3E7D6'),
      borderRadius: BorderRadius.circular(15),

    ),

  );
}



