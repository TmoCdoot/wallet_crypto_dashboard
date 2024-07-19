import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:wallet_crypto_dashboard/pages/home/widget/modals/searchBar.modals.dart';

class globalSection extends StatefulWidget {
  const globalSection({super.key});

  @override
  State<globalSection> createState() => _globalSection();
}

class _globalSection extends State<globalSection> {

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 25, right: 25, bottom: 20),
      child: Column(
        children: [
          SizedBox(height: 30),
          Container(
            margin: EdgeInsets.all(0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  '\$ 30,540.00',
                  style: TextStyle(
                    height: 1,
                    fontSize: 40,
                    color: Color.fromRGBO(254, 255, 254, 1),
                    fontWeight: FontWeight.w800,
                  ),
                )
              ],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                '€ 28,290.00',
                style: TextStyle(
                  fontSize: 16,
                  color: Color.fromRGBO(254, 255, 254, 1),
                  fontWeight: FontWeight.w400,
                ),
              ),
              SizedBox(width: 10),
              Text(
                '+ 5,42%',
                style: TextStyle(
                  fontSize: 16,
                  color: Color.fromRGBO(107, 181, 36, 1),
                  fontWeight: FontWeight.w400,
                ),
              )
            ],
          ),
          SizedBox(height: 30),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Column(
                children: <Widget>[
                  InkWell(
                    onTap: () => showBarModalBottomSheet(
                        context: context,
                        backgroundColor: Colors.transparent,
                        builder: (context) => searchBar()),
                    child: Image.asset(
                      'assets/images/add.png',
                      height: 50,
                    ),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Text(
                    'Add token',
                    style: TextStyle(
                      fontSize: 12,
                      color: Color.fromRGBO(254, 255, 254, 1),
                      fontWeight: FontWeight.w200,
                    ),
                  )
                ],
              ),
              SizedBox(width: 40),
              Column(
                children: [
                  InkWell(
                    onTap: () {
                      print("statistique");
                    },
                    child: Image.asset(
                      'assets/images/stat.png',
                      height: 50,
                    ),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Text(
                    'Statistique',
                    style: TextStyle(
                      fontSize: 14,
                      color: Color.fromRGBO(254, 255, 254, 1),
                      fontWeight: FontWeight.w200,
                    ),
                  )
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
