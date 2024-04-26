
import 'package:flutter/material.dart';

Widget btn (var iconn,context,name){
  return Container(
    height: 70,
    decoration: BoxDecoration(
      shape: BoxShape.rectangle,
      borderRadius: BorderRadius.circular(28),
      
    ),
    child: ElevatedButton.icon(onPressed: (){
Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>name));
    }, icon: Icon(iconn,size: 40,color: Colors.grey.shade900,), label: const Text("")) ,
  );
}


Widget Grid (){
  return Stack(
    
    children: [
      Container(
        decoration: BoxDecoration(
      color:  Colors.grey.shade300,
          borderRadius: BorderRadius.circular(18)
        ),
      margin: EdgeInsets.only(top: 100,left: 20),
      height: 550,
      width: 300,
           
    ),
    
    Container(
      height: 240,
      width: 260,
      margin: EdgeInsets.only(top: 130,left: 42),
      decoration: BoxDecoration(
      color: Colors.white,

        borderRadius: BorderRadius.circular(18),
      ),

    )
    ],
  );
}