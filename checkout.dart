// import 'package:flutter/material.dart';
// import 'package:stripe_payment/stripe_payment.dart';

// class CheckoutScreen extends StatefulWidget {
//   const CheckoutScreen({Key? key}) : super(key: key);

//   @override
//   _CheckoutScreenState createState() => _CheckoutScreenState();
// }

// class _CheckoutScreenState extends State<CheckoutScreen> {
//   @override
//   void initState() {
//     super.initState();
//     StripePayment.setOptions(
//       StripeOptions(
//         publishableKey: "your_publishable_key",
//         merchantId: "your_merchant_id",
//         androidPayMode: 'test', // 'test' or 'production'
//       ),
//     );
//   }

//   Future<void> _startPayment() async {
//     try {
//       final paymentMethod = await StripePayment.paymentRequestWithCardForm(
//         CardFormPaymentRequest(),
//       );

//       // Use the obtained paymentMethod for further processing
//       print('Payment method: ${paymentMethod.id}');
//       // Process the payment with your backend server
//     } catch (err) {
//       print('Error during payment: $err');
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Checkout'),
//       ),
//       body: Center(
//         child: ElevatedButton(
//           onPressed: _startPayment,
//           child: Text('Proceed to Pay'),
//         ),
//       ),
//     );
//   }
// }
