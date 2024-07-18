import 'package:flutter/material.dart';
import 'package:wallet_crypto_dashboard/pages/home/widget/listWidget.dart';

class listSection extends StatefulWidget {
  const listSection({super.key});

  @override
  State<listSection> createState() => _listSection();
}

class _listSection extends State<listSection> {
  var viewState;


@override
  void initState() {
    super.initState();
    viewState = 0;
  }

  @override
  Widget build(BuildContext context) {
    return StatefulBuilder(builder: (BuildContext context, setState) {
      return Expanded(
      flex: 1,
      child: Column(
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
                border: Border(
                    bottom: BorderSide(color: Color.fromRGBO(29, 28, 31, 1)))),
            padding: EdgeInsets.only(left: 25, right: 25, bottom: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                InkWell(
                  onTap: () {setState(() {
                    viewState = 0;
                  },);},
                  child: Text(
                    "Tokens",
                    style: TextStyle(
                      fontSize: 20,
                      color: viewState==0 ? Color.fromRGBO(254, 255, 254, 1): Color.fromRGBO(168, 168, 172, 1),
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                SizedBox(
                  width: 40,
                ),
                InkWell(
                  onTap: () {setState(() {
                    viewState = 1;
                  },);},
                  child: Text(
                    "Collectibles",
                    style: TextStyle(
                      fontSize: 20,
                      color: viewState==0 ? Color.fromRGBO(168, 168, 172, 1) : Color.fromRGBO(254, 255, 254, 1),
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded( //switch to token collectible
            child: viewState==0 ? TokenRender() : CollectiblesRender(),
          )
        ],
      ),
    );
    });
    
  }

  Widget TokenRender() {
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: Container(
          //color: Colors.green,
          child: Column(
        children: [
          listWidget(),
        ],
      )),
    );
  }

  Widget CollectiblesRender() {
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: Text('data'),
    );
  }
}
