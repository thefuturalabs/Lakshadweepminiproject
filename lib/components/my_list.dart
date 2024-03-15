import 'package:flutter/material.dart';

class MyList extends StatelessWidget {
  final String text;
  final IconData icon;
  final void Function()? ontap;

  const MyList(
      {super.key, required this.text, required this.icon, required this.ontap});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(icon),
      title: Text(text),
      onTap: ontap,
    );
  }
}
