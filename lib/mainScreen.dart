import 'package:flutter/material.dart';

class mainScreen extends StatefulWidget {
  const mainScreen({Key? key}) : super(key: key);

  @override
  State<mainScreen> createState() => _mainScreenState();
}

class _mainScreenState extends State<mainScreen> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextButton(
          onPressed: () {},
          child: Text('Trendyol Hesap'),
        ),
        TextButton(
          onPressed: () {},
          child: Text('Akrilik Maliyet Hesap'),
        ),
        TextButton(
          onPressed: () {},
          child: Text('MDF Maliyet Hesap'),
        ),
        TextButton(
          onPressed: () {},
          child: Text('Ivır Zıvır fiyat listesi'),
        ),
      ],
    );
  }
}
