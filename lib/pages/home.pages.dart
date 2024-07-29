import 'package:flutter/material.dart';
import 'package:wallet_crypto_dashboard/block/walletUserInfo.block.dart';
import 'package:wallet_crypto_dashboard/block/walletUserData.block.dart';


class HomePage extends StatefulWidget {
  const HomePage({super.key});      

  @override
  State<HomePage> createState() => _HomePage();
}

class _HomePage extends State<HomePage> {

  @override
  void initState() {
    super.initState();
  }

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
                children: <Widget> [
                    walletUserInfo(),
                    walletUserData(),
                ],
              )
            ],
          ),
        );
    }
}

