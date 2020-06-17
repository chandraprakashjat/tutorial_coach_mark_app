
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyContainer extends StatelessWidget
{
 String title;
 String description;
 IconData icon;

 MyContainer({this.title,this.description,this.icon});
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[

          Icon(icon,color: Colors.white,),
          Text(
            title, style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.white,
              fontSize: 20.0),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 10.0),
            child: Text(
             description,
              style: TextStyle(color: Colors.white),
            ),
          )
        ],
      ),
    );
  }
}
