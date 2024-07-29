import 'package:flutter/material.dart';
import 'package:wallet_crypto_dashboard/pages/home.pages.dart';

void main() {
  //lance app (tv, mobile, ordi)
  runApp(MyWidget());
}

class MyWidget extends StatelessWidget {
  const MyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'DashBoard',
      theme: ThemeData(
        fontFamily: "Proxima",
      ),
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}
                           
