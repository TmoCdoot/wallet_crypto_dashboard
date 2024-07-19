import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:wallet_crypto_dashboard/pages/class/classToken.dart';
import 'package:wallet_crypto_dashboard/pages/home/widget/modals/formAddToken.modals.dart';

class searchBar extends StatefulWidget {
  const searchBar({super.key});

  @override
  State<searchBar> createState() => _searchBar();
}

class _searchBar extends State<searchBar> {
  static const List<Map<String, dynamic>> listTest = [
    {
      'name': 'Ethereum',
      'price': '2,768',
      'perc': '+3.98',
      'quantity': '3.023',
      'symb': 'ETH'
    },
    {
      'name': 'Bitcoin',
      'price': '62,892',
      'perc': '+4.8',
      'quantity': '1.02',
      'symb': 'BTC'
    },
    {
      'name': 'Cardano',
      'price': '1.7',
      'perc': '+3.98',
      'quantity': '343.023',
      'symb': 'ADA'
    },
    {
      'name': 'Filecoin',
      'price': '7.978',
      'perc': '+23.8',
      'quantity': '10.02',
      'symb': 'FIL'
    },
    {
      'name': 'Binance Coin',
      'price': '276.8',
      'perc': '+41.98',
      'quantity': '34.023',
      'symb': 'BNB'
    },
    {
      'name': 'Fantom',
      'price': '0.092',
      'perc': '+1.8',
      'quantity': '1.02',
      'symb': 'FTM'
    },
    {
      'name': 'Tether',
      'price': '1',
      'perc': '+3.98',
      'quantity': '332.023',
      'symb': 'USDT'
    },
    {
      'name': 'Axelar',
      'price': '0.908',
      'perc': '+8',
      'quantity': '209.09',
      'symb': 'AXL'
    },
    {
      'name': 'Near Protocol',
      'price': '5.867',
      'perc': '+3.98',
      'quantity': '786.023',
      'symb': 'NEAR'
    },
    {
      'name': 'Chiliz',
      'price': '0.071',
      'perc': '+8',
      'quantity': '10,920.02',
      'symb': 'CHZ'
    },
  ]; //liste aléatoire

  List<classToken> listAppToken = List.from(listTest.map((doc) => classToken.fromSnapshot(doc)));

  List<classToken> listTokenFindBySearchBar = []; //data trouver par valuer rechercher
  
  final searchBarTokenController = TextEditingController(); //recup data dans la searchbox

  @override
  void initState() {
    super.initState();
    searchBarTokenController.addListener(searchBarListener);
    listTokenFindBySearchBar = listAppToken; //add le listener au controller
  }

  //jsp
  @override
  void dispose() {
    searchBarTokenController.dispose();
    super.dispose();
  }

  //init la fonction de recherche
  void searchBarListener() {
    listFinderByToken(searchBarTokenController.text);
  }

  //fonction qui permet de chercher une ou plusieur valeur dans une list
  void listFinderByToken(String query) {
    setState(() {
      listTokenFindBySearchBar = [];

      listTokenFindBySearchBar = listAppToken.where((element) => element
          .classToken_name!
          .toLowerCase()
          .startsWith(query.toLowerCase())).toList();
    });
  }

  //modal pour ajout de token
  @override
  Widget build(BuildContext context) {
    return StatefulBuilder(builder: (BuildContext context, setState) {
      return Container(
          padding: EdgeInsets.all(15),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: Color.fromRGBO(10, 11, 10, 1),
          ),
          height: 700,
          child: Column(mainAxisSize: MainAxisSize.max, children: [
            Text(
              'Add Token',
              style: TextStyle(
                fontSize: 15,
                color: Color.fromRGBO(254, 255, 254, 1),
                fontWeight: FontWeight.w700,
              ),
            ),
            SizedBox(
              height: 20,
            ),
            TextField(
              controller: searchBarTokenController,
              onChanged: (text) {
                setState(() {});
              },
              decoration: InputDecoration(
                hintText: 'Search Token',
                hintStyle: TextStyle(color: Color.fromARGB(255, 59, 61, 66)),
                fillColor: Color.fromRGBO(20, 21, 23, 1),
                filled: true,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                  borderSide: BorderSide(
                    width: 0,
                    style: BorderStyle.none,
                  ),
                ),
              ),
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w600,
                fontSize: 16,
              ),
            ),
            SizedBox(height: 30,),
            Expanded(
              child: ListView.builder(
                  itemCount: listTokenFindBySearchBar.isEmpty // si listokensearchbox vide alors utiliser listoken sinon utiliser listokensearchbox
                      ? 1
                      : listTokenFindBySearchBar.length,
                  itemBuilder: (context, index) {
                    final listTokenForRender = listTokenFindBySearchBar.isEmpty
                        ? listAppToken[index]
                        : listTokenFindBySearchBar[index];

                    return showListByResult(listTokenForRender);
                  }),
            ),
          ]));
    });
  }

  Widget showListByResult (listTokenForRender) {
    if (listTokenFindBySearchBar.isNotEmpty) {
      return GestureDetector(
        onTap: () {
          showMaterialModalBottomSheet(
            context: context,
            backgroundColor: Colors.transparent,
            builder: (context) => formAddToken(listTokenForRender: listTokenForRender,)
          );
        },
        child: Container(
            padding: EdgeInsets.only(left: 20, right: 20),
            margin: EdgeInsets.only(bottom: 30),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Image.asset(
                      'assets/images/${listTokenForRender.classToken_symb}.png',
                      width: 40,
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    Text(
                      "${listTokenForRender.classToken_name}".toUpperCase(),
                      style: TextStyle(
                          color: Color.fromRGBO(254, 255, 254, 1),
                          fontWeight: FontWeight.w700),
                    )
                  ],
                ),
                Text(
                  "${listTokenForRender.classToken_price} \$",
                  style: TextStyle(
                    fontSize: 15,
                    color: Color.fromRGBO(254, 255, 254, 1),
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ],
            )
            ),
      );
    } else {
      return Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "Sorry, we didn't find your token",
            style: TextStyle(color: Color.fromRGBO(254, 255, 254, 1)),
          ),
        ],
      );
    }
  }
}
