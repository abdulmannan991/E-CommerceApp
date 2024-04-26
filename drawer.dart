import 'package:ecommerce_app/cart.dart';
import 'package:ecommerce_app/listt_ile.dart';
import 'package:flutter/material.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
        backgroundColor: Theme.of(context).colorScheme.background,
      
      child: Column(
        children: [
          DrawerHeader(child: Padding(
            padding: const EdgeInsets.only(right: 40),
            child: Center(
              child: Image.asset("images/06-loader-telega-unscreen.gif"),
              
            ),
            
          )
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: MyTile(text: "Shop", icon: Icons.home,iconColor: Colors.grey.shade700,),
          ),
          GestureDetector(
  onTap: () {
    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => CartItems(cartItems: [],)));
  },
  child: Padding(
    padding: EdgeInsets.all(8.0),
    child: MyTile(text: "Cart", icon: Icons.shopping_cart, iconColor: Colors.grey.shade700,),
  ),
),

          Padding(
            padding:  EdgeInsets.all(8.0),
            child: MyTile(text: "Exit", icon: Icons.exit_to_app,iconColor: Colors.grey.shade700,),
          ),
          
        ],
        
      ),
      
    );
    
  }
}