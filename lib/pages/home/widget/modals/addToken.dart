import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:wallet_crypto_dashboard/pages/class/classToken.dart';

class addToken extends StatefulWidget {
  const addToken({super.key});

  @override
  State<addToken> createState() => _addToken();
}

class _addToken extends State<addToken> {
  static const List<Map<String, dynamic>> listToken = [
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

  List<classToken> TokenUserList = List.from(listToken.map((doc) => classToken.fromSnapshot(doc)));

  List<classToken> listTokenSearchBox = []; //data trouver par valuer rechercher
  
  final searchController = TextEditingController(); //recup data dans la searchbox
  final buyPriceAddToken = TextEditingController(); 
  final quantityAddToken = TextEditingController(); 

  @override
  void initState() {
    super.initState();
    searchController.addListener(searchListener);
    listTokenSearchBox = TokenUserList; //add le listener au controller
  }

  //jsp
  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }

  //init la fonction de recherche
  void searchListener() {
    search(searchController.text);
  }

  //fonction qui permet de chercher une ou plusieur valeur dans une list
  void search(String query) {
    setState(() {
      listTokenSearchBox = [];

      listTokenSearchBox = TokenUserList.where((element) => element
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
              controller: searchController,
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
                  itemCount: listTokenSearchBox
                          .isEmpty // si listokensearchbox vide alors utiliser listoken sinon utiliser listokensearchbox
                      ? 1
                      : listTokenSearchBox.length,
                  itemBuilder: (context, index) {
                    final tokenList = listTokenSearchBox.isEmpty
                        ? TokenUserList[index]
                        : listTokenSearchBox[index];

                    return listRender(tokenList);
                  }),
            ),
          ]));
    });
  }

  Widget listRender(tokenList) {
    if (listTokenSearchBox.length != 0) {
      return GestureDetector(
        onTap: () {
          showMaterialModalBottomSheet(
            context: context,
            backgroundColor: Colors.transparent,
            builder: (context) => tokenAddPrice(tokenList)
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
                      'assets/images/${tokenList.classToken_symb}.png',
                      width: 40,
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    Text(
                      "${tokenList.classToken_name}".toUpperCase(),
                      style: TextStyle(
                          color: Color.fromRGBO(254, 255, 254, 1),
                          fontWeight: FontWeight.w700),
                    )
                  ],
                ),
                Text(
                  "${tokenList.classToken_price} \$",
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

  Widget tokenAddPrice(classToken tokenList) {
    return Container(
      padding: EdgeInsets.all(15),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: Color.fromRGBO(10, 11, 10, 1),
          ),
          height: 720,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  InkWell(
                    
                    onTap: () => {
                      Navigator.pop(context)
                    },
                    child: Container(
                      alignment: Alignment.topLeft,
                      width: 50,
                      height: 20,
                      decoration: BoxDecoration(
                        //color: Colors.red
                      ),
                      child: Image.asset(
                          'assets/images/back.png',
                          width: 20,
                          height: 20,
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      margin: EdgeInsets.only(right: 30),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Enter Amount',
                            style: TextStyle(
                              fontSize: 15,
                              color: Color.fromRGBO(254, 255, 254, 1),
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20,),
              Row(
                children: <Widget>[
                  Container(
                    width: 200,
                    child: TextFormField(
                      controller: quantityAddToken,
                      textAlign: TextAlign.right,
                      autofocus: true,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                      ),
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w800,
                        fontSize: 40,
                        
                      ),
                      /*initialValue: valueBuilder,
                      onSaved: (text) {
                        fieldsController.text = text.trim();
                      },*/
                      
                      keyboardType: TextInputType.numberWithOptions(decimal: true),
                    ),
                  ),
                  SizedBox(width: 10,),
                  Text('${tokenList.classToken_symb}',
                    style: TextStyle(
                      fontSize: 40,
                      color: Colors.white,
                      fontWeight: FontWeight.w700
                    ),
                  ),
                  SizedBox(height: 15,),
                  
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                      'assets/images/switch.png',
                      width: 20,
                  ),
                  SizedBox(width: 10,),
                  Text("\$2,899.08",
                        style: TextStyle(
                          fontSize: 12,
                          color: Color.fromARGB(255, 59, 61, 66),
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                ],
              ),
              SizedBox(height: 30),
              Row(
                children: [
                  Text("Buy Price",
                    style: TextStyle(
                        fontSize: 15,
                        color: Color.fromRGBO(254, 255, 254, 1),
                        fontWeight: FontWeight.w700,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 5,),
              TextField(
                controller: buyPriceAddToken,
                keyboardType: TextInputType.numberWithOptions(decimal: true),
                decoration: InputDecoration(
                  hintText: 'Optional',
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
              SizedBox(height: 40,),
              Container(
                width: 400,
                height: 60,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor:
                        Color.fromRGBO(54, 205, 120, 1),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                  onPressed: () => addToken(tokenList),
                  child: Text('Add Token',
                      style: TextStyle(
                        fontSize: 17,
                        color:
                            Color.fromRGBO(254, 255, 254, 1),
                        fontWeight: FontWeight.w600,
                      )),
                ),
              ),
            ],
          ),
    );
  }

  void addToken(classToken tokenList) {
    print(buyPriceAddToken.text);
    print(quantityAddToken.text);
    print(tokenList.classToken_name);
    quantityAddToken.clear();
    buyPriceAddToken.clear();
    Navigator.pop(context); 
    Navigator.pop(context); 
  }
}
