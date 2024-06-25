import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:wallet_crypto_dashboard/pages/class/classToken.dart';

class globalSection extends StatefulWidget {
  const globalSection({super.key});

  @override
  State<globalSection> createState() => _globalSection();
}

class _globalSection extends State<globalSection> {
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
    }
  ]; //liste aléatoire
  
  List<classToken> TokenUserList =
    List.from(listToken.map((doc) => classToken.fromSnapshot(doc)));
  


  List<classToken> listTokenSearchBox = []; //data trouver par valuer rechercher
  final searchController = TextEditingController(); //recup data dans la searchbox

  @override
  void initState() {
    super.initState();
    searchController.addListener(searchListener); //add le listener au controller
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
    if (query.isEmpty) {
      setState(() {
        listTokenSearchBox = TokenUserList;
      });
    } else {
      setState(() {
        listTokenSearchBox = [];

        listTokenSearchBox = TokenUserList.where((element) => element.classToken_name!.toLowerCase().contains(query.toLowerCase())).toList();

        
            
           // .where((element) => element.toLowerCase().contains(query.toLowerCase())).toList();
      });
    }
  }



  @override
  Widget build(BuildContext context) {
    return Container(
      //color: Colors.red,
      //height: 200,
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
                    onTap: () => showMaterialModalBottomSheet(
                        context: context,
                        backgroundColor: Colors.transparent,
                        builder: (context) => buildAddToken()),
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
//modal pour ajout de token
  Widget buildAddToken() {
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
                fontWeight: FontWeight.w600,
              ),
            ),
            SizedBox(
              height: 20,
            ),
            SizedBox(
              width: 320,
              child: TextField(
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
            ),
            /*SearchBar(
                controller: searchController,
                onSubmitted: (text) {
                  print(text);
                  setState(() {});
                },
                trailing: [
                  IconButton(onPressed: () {}, icon: const Icon(Icons.search))
                ]),*/
            Expanded(
              child: ListView.builder(
                  itemCount: listTokenSearchBox.isEmpty // si listokensearchbox vide alors utiliser listoken sinon utiliser listokensearchbox
                      ? TokenUserList.length
                      : listTokenSearchBox.length,
                  itemBuilder: (context, index) {
                    final token = listTokenSearchBox.isEmpty
                        ? TokenUserList[index]
                        : listTokenSearchBox[index];

                    return Card(
                      child: Column(
                        children: [
                          Text("${token.classToken_name}"),
                          //Text(token),
                        ],
                      ),
                    );
                  }),
            )
          ]));
    });
  }
}
