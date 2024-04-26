import 'package:flutter/material.dart';

class MyTile extends StatelessWidget {


final String text;
final IconData icon;
final void Function()? ontap;

  const MyTile({super.key, required this.text, required this.icon, this.ontap, required Color iconColor});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(icon),
      iconColor: Colors.grey,
      title: Text(text),
      onTap: ontap,
    );
  }
}