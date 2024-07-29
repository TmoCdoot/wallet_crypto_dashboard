import 'package:flutter/material.dart';
import 'package:wallet_crypto_dashboard/sections/userTokenList.sections.dart';

class walletUserData extends StatefulWidget {
  const walletUserData({super.key});

  @override
  State<walletUserData> createState() => _walletUserData();
}

class _walletUserData extends State<walletUserData> {
  var stateShowSection;

  @override
  void initState() {
    super.initState();
    stateShowSection = "token";
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
                      bottom:
                          BorderSide(color: Color.fromRGBO(29, 28, 31, 1)))),
              padding: EdgeInsets.only(left: 25, right: 25),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  InkWell(
                    onTap: () {
                      setState(
                        () {
                          stateShowSection = "token";
                        },
                      );
                    },
                    child: Container(
                      padding: EdgeInsets.all(10),
                      child: Text(
                        "Tokens",
                        style: TextStyle(
                          fontSize: 20,
                          color: stateShowSection == "token"
                              ? Color.fromRGBO(254, 255, 254, 1)
                              : Color.fromRGBO(168, 168, 172, 1),
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 40,
                  ),
                  InkWell(
                    onTap: () {
                      setState(
                        () {
                          stateShowSection = "collectibles";
                        },
                      );
                    },
                    child: Container(
                      padding: EdgeInsets.all(10),
                      child: Text(
                        "Collectibles",
                        style: TextStyle(
                          fontSize: 20,
                          color: stateShowSection == "token"
                              ? Color.fromRGBO(168, 168, 172, 1)
                              : Color.fromRGBO(254, 255, 254, 1),
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              //switch to token collectible
              child: stateShowSection == "token"
                  ? showTokenSection()
                  : showCollectiblesSection(),
            )
          ],
        ),
      );
    });
  }

  Widget showTokenSection() {
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: Container(
          child: Column(
        children: [
          userTokenList(),
        ],
      )),
    );
  }

  Widget showCollectiblesSection() {
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: Text('data'),
    );
  }
}
