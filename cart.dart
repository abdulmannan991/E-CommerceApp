import 'package:ecommerce_app/checkout.dart';
import 'package:flutter/material.dart';

class CartItems extends StatefulWidget {
  final List<Map<String, dynamic>> cartItems;

  const CartItems({Key? key, required this.cartItems}) : super(key: key);

  @override
  _CartItemsState createState() => _CartItemsState();
}

class _CartItemsState extends State<CartItems> {
  void removeFromCart(BuildContext context, int index) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text("Item removed from the cart"),
      ),
    );
    setState(() {
      widget.cartItems.removeAt(index);
    });
  }

  double calculateTotalAmount() {
    double total = 0.0;
    for (var item in widget.cartItems) {
      if (item['Price'] is String) {
        total += double.parse(item['Price']);
      } else if (item['Price'] is int) {
        total += (item['Price'] as int).toDouble();
      }
      // Add additional checks for other data types if needed
    }
    return total;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.background,
        elevation: 0,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back, color: Colors.grey.shade700, size: 30),
        ),
      ),
      body: ListView.builder(
        itemCount: widget.cartItems.length,
        itemBuilder: (context, index) {
          return Card(
            color: Color(0xFF40E0D0),
           shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12.0), // Adjust the radius as needed
            ),
            margin: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
            elevation: 4,
            child: ListTile(
              title: Text(widget.cartItems[index]['Prodcut']),
              subtitle: Text(widget.cartItems[index]['Description']),
              leading: Image.asset(
                widget.cartItems[index]['Image'],
                height: 80,
                width: 80,
                fit: BoxFit.cover,
              ),
              trailing: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  IconButton(
                    icon: Icon(Icons.remove),
                    onPressed: () {
                      removeFromCart(context, index);
                    },
                  ),
                  Text('\$ ${widget.cartItems[index]["Price"]}'),
                ],
              ),
              onTap: () {
                // You can add additional functionality when tapping on an item
              },
            ),
          );
        },
      ),
      bottomNavigationBar: BottomAppBar(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Total Amount: \$ ${calculateTotalAmount()}',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
             ElevatedButton(
  onPressed: () {
// Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>CheckoutScreen()));
  },
  style: ElevatedButton.styleFrom(
    primary:  Color(0xFF40E0D0),
 // Replace with the desired button color
    onPrimary: Colors.black, // Text color
    elevation: 3, // Elevation of the button
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(8), // Adjust the border radius as needed
    ),
    padding: EdgeInsets.symmetric(vertical: 12, horizontal: 16), // Button padding
  ),
  child: Text(
    'Check Out',
    style: TextStyle(fontSize: 16),
  ),
)

            ],
          ),
        ),
      ),
    );
  }
}
