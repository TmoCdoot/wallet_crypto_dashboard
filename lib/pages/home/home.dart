import 'package:flutter/material.dart';
import 'package:wallet_crypto_dashboard/pages/home/widget/globalSection.dart';
import 'package:wallet_crypto_dashboard/pages/home/widget/header.dart';
import 'package:wallet_crypto_dashboard/pages/home/widget/listSection.dart';


class HomePage extends StatelessWidget {
  const HomePage({super.key});      

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(10, 11, 10, 1),
      body: Stack(
          children: [
            Positioned(
              top: -100,
              left: 100,
              child: Image.asset('assets/images/bck1.png',opacity: const AlwaysStoppedAnimation(.2))
            ),
            Positioned(
              bottom: -400,
              right: 0,
              child: Image.asset('assets/images/bck2.png',opacity: const AlwaysStoppedAnimation(.2))
            ),
            Column(
              children: [
                  Header(),
                  globalSection(),
                  listSection(),
              ],
            )
          ],
        ),
      );
  }
}

