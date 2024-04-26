import 'package:ecommerce_app/items.dart';
import 'package:ecommerce_app/widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:animated_icon_button/animated_icon_button.dart';

class GreetingScreen extends StatefulWidget {
  const GreetingScreen({super.key});

  @override
  State<GreetingScreen> createState() => _GreetingScreenState();
}

class _GreetingScreenState extends State<GreetingScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,

      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
         Container(
          margin: EdgeInsets.only(right: 30),
           child: Image.asset("images/06-loader-telega-unscreen.gif",),
         ),
          const Text("M I N I M A L S H O P",style: TextStyle(fontWeight: FontWeight.w900,fontSize: 20),),

const SizedBox(height: 10,),
          const Text("Don't wait go and buy >>",style: TextStyle(color: Color.fromARGB(255, 111, 111, 111)),),
  
  const SizedBox(height: 15,),
  btn(CupertinoIcons.arrow_right, context, const ItemsPage())

        ],
        
        ),

        
      );
   
  }
}