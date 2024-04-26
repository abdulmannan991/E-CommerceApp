import 'package:ecommerce_app/cart.dart';
import 'package:ecommerce_app/drawer.dart';
import 'package:ecommerce_app/product_detail.dart';
import 'package:ecommerce_app/widget.dart';
import 'package:flutter/material.dart';

class ItemsPage extends StatefulWidget {
  const ItemsPage({Key? key}) : super(key: key);

  @override
  State<ItemsPage> createState() => _ItemsPageState();
}

class _ItemsPageState extends State<ItemsPage> {
  List<Map<String, dynamic>> cartItems = [];

  void addToCart(BuildContext context, Map<String, dynamic> product) {
    setState(() {
      cartItems.add(product);
    });

    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        content: Text("Add this item to your cart"),
        actions: [
          MaterialButton(
            onPressed: () => Navigator.pop(context),
            child: Text("Cancel"),
          ),
          MaterialButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: Text("OK"),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        elevation: 0,
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => CartItems(cartItems: cartItems)),
              );
            },
            icon: Icon(Icons.local_grocery_store, color: Theme.of(context).colorScheme.background, size: 30),
          ),
        ],
      ),
      drawer: MyDrawer(),
      body: Stack(
        children: [
          Container(
            margin: const EdgeInsets.only(left: 20, top: 20),
            child: Text(
              "Shop",
              style: TextStyle(color: Theme.of(context).colorScheme.inversePrimary, fontSize: 25, fontWeight: FontWeight.bold, fontStyle: FontStyle.italic),
            ),
          ),
          Container(
            margin: const EdgeInsets.only(left: 20, top: 50),
            child: Text(
              "Pick from a selected list of premium products",
              style: TextStyle(color: Theme.of(context).colorScheme.inversePrimary, fontSize: 15),
            ),
          ),
          ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: ProductDetail.length,
            itemBuilder: (context, index) {
              return Stack(
                children: [
                  Grid(),
                  Container(
                    margin: EdgeInsets.only(top: 400, left: 60),
                    child: Text("${ProductDetail[index]["Prodcut"]}", style: TextStyle(fontWeight: FontWeight.bold, fontStyle: FontStyle.italic, fontSize: 30, color: Theme.of(context).colorScheme.inversePrimary)),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 440, left: 40),
                    child: Text("${ProductDetail[index]["Description"]}", style: TextStyle(fontSize: 12, color: Theme.of(context).colorScheme.inversePrimary)),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 570, left: 40),
                    child: Text('\$ ${ProductDetail[index]["Price"]}', style: TextStyle(fontSize: 20, color: Theme.of(context).colorScheme.inversePrimary, fontWeight: FontWeight.bold)),
                  ),
                  Container(
                    height: 50,
                    width: 50,
                    margin: EdgeInsets.only(top: 560, left: 250),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(18),
                    ),
                    child: IconButton(
                      onPressed: () => addToCart(context, ProductDetail[index]),
                      icon: Icon(Icons.add),
                    ),
                  ),
                  Container(
                    height: 140,
                    width: 290,
                    margin: EdgeInsets.only(top: 200, left: 20),
                    child: Image.asset(ProductDetail[index]["Image"]),
                  ),
                ],
              );
            },
          ),
        ],
      ),
    );
  }
}

