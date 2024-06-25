import 'package:flutter/material.dart';
import 'package:wallet_crypto_dashboard/pages/home/widget/listWidget.dart';

class listSection extends StatelessWidget {
  const listSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 1,
      child: Column(
        children: [
          Container(
            decoration: BoxDecoration(
                border: Border(
                    bottom: BorderSide(color: Color.fromRGBO(29, 28, 31, 1)))),
            padding: EdgeInsets.only(left: 25, right: 25, bottom: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                InkWell(
                  onTap: () {print("tokens");},
                  child: Text(
                    "Tokens",
                    style: TextStyle(
                      fontSize: 20,
                      color: Color.fromRGBO(254, 255, 254, 1),
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                SizedBox(
                  width: 40,
                ),
                InkWell(
                  onTap: () {print("collectibles");},
                  child: Text(
                    "Collectibles",
                    style: TextStyle(
                      fontSize: 20,
                      color: Color.fromRGBO(168, 168, 172, 1),
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Container(
                  //color: Colors.green,
                  child: Column(
                    children: [
                      listWidget(),
                    ],
                  )),
            ),
          )
        ],
      ),
    );
  }
}
