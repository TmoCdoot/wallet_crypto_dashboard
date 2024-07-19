import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:wallet_crypto_dashboard/pages/class/classToken.dart';
import 'package:wallet_crypto_dashboard/pages/home/widget/modals/editUserToken.modals.dart';

class userTokenList extends StatefulWidget {
  const userTokenList({super.key});

  @override
  State<userTokenList> createState() => _userTokenList();
}

class _userTokenList extends State<userTokenList> {
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
  ];

  List<classToken> listAppToken = List.from(listTest.map((doc) => classToken.fromSnapshot(doc)));


  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      physics: NeverScrollableScrollPhysics(), //prend la physique du parent
      padding: EdgeInsets.zero,
      shrinkWrap: true,
      itemCount: listAppToken.length,
      itemBuilder: (context, index) {
        return Slidable(
          startActionPane: ActionPane(
            motion: ScrollMotion(),
            children: [
              editUserToken(userTokenSelect: listAppToken[index])
              /*SlidableAction(
                onPressed: ((context) {
                  showBarModalBottomSheet(
                      context: context,
                      backgroundColor: Colors.transparent,
                      builder: (ctx) => Container(
                            padding: EdgeInsets.all(20),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: Color.fromRGBO(10, 11, 10, 1),
                            ),
                            height: 760,
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Text(
                                  'Edit ${listAppToken[index].classToken_name}',
                                  style: TextStyle(
                                    fontSize: 15,
                                    color: Color.fromRGBO(254, 255, 254, 1),
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                SizedBox(
                                  height: 20,
                                ),
                                Container(
                                  padding: EdgeInsets.only(
                                      left: 15, right: 10, bottom: 10, top: 20),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(12),
                                    color: Color.fromRGBO(20, 21, 23, 1),
                                  ),
                                  child: Column(
                                    children: [
                                      Row(
                                        children: [
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text("Quantity",
                                                  style: TextStyle(
                                                    fontSize: 14,
                                                    color: Color.fromRGBO(
                                                        168, 168, 172, 1),
                                                    fontWeight: FontWeight.w600,
                                                  )),
                                              Container(
                                                child: Row(
                                                  children: [
                                                    SizedBox(
                                                      width: 230,
                                                      child: TextField(
                                                        controller:
                                                            quantityEditToken,
                                                        autofocus: true,
                                                        keyboardType: TextInputType
                                                            .numberWithOptions(
                                                                decimal: true),
                                                        decoration:
                                                            InputDecoration(
                                                          border:
                                                              InputBorder.none,
                                                        ),
                                                        style: TextStyle(
                                                          color: Colors.white,
                                                          fontWeight:
                                                              FontWeight.w800,
                                                          fontSize: 40,
                                                        ),
                                                      ),
                                                    ),
                                                    Container(
                                                      padding: EdgeInsets.only(
                                                          left: 10),
                                                      child: Row(
                                                        children: [
                                                          Image.asset(
                                                            'assets/images/${listAppToken[index].classToken_symb}.png',
                                                            width: 40,
                                                          ),
                                                          Container(
                                                            padding:
                                                                EdgeInsets.only(
                                                                    left: 10),
                                                            child: Text(
                                                              "${listAppToken[index].classToken_symb}",
                                                              style: TextStyle(
                                                                  fontSize: 16,
                                                                  color: Colors
                                                                      .white,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w700),
                                                            ),
                                                          )
                                                        ],
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              Text(
                                                  '1 ${listAppToken[index].classToken_symb} ≈ 3290.90 \$ ',
                                                  style: TextStyle(
                                                    fontSize: 14,
                                                    color: Color.fromARGB(
                                                        255, 59, 61, 66),
                                                    fontWeight: FontWeight.w600,
                                                  )),
                                              SizedBox(
                                                height: 5,
                                              )
                                            ],
                                          ),
                                        ],
                                      ),
                                      Container(
                                        decoration: BoxDecoration(
                                            border: Border(
                                                bottom: BorderSide(
                                                    color: Color.fromRGBO(
                                                        29, 28, 31, 1)))),
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Container(
                                            padding: EdgeInsets.only(top: 20),
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text("Buy price",
                                                    style: TextStyle(
                                                      fontSize: 14,
                                                      color: Color.fromRGBO(
                                                          168, 168, 172, 1),
                                                      fontWeight:
                                                          FontWeight.w600,
                                                    )),
                                                Container(
                                                  child: Row(
                                                    children: [
                                                      SizedBox(
                                                        width: 300,
                                                        child: TextField(
                                                          controller:
                                                              buyPriceEditToken,
                                                          keyboardType:
                                                              TextInputType
                                                                  .numberWithOptions(
                                                                      decimal:
                                                                          true),
                                                          decoration:
                                                              InputDecoration(
                                                                  border:
                                                                      InputBorder
                                                                          .none),
                                                          style: TextStyle(
                                                            color: Colors.white,
                                                            fontWeight:
                                                                FontWeight.w800,
                                                            fontSize: 40,
                                                          ),
                                                        ),
                                                      ),
                                                      Container(
                                                        padding:
                                                            EdgeInsets.only(
                                                                left: 10),
                                                        child: Text(
                                                          "\$",
                                                          style: TextStyle(
                                                              fontSize: 18,
                                                              color:
                                                                  Colors.white,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w700),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(height: 40),
                                Container(
                                  width: 300,
                                  child: ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor:
                                          Color.fromRGBO(54, 205, 120, 1),
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(15),
                                      ),
                                    ),
                                    onPressed: () => editToken(),
                                    child: Text('Save Token',
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
                          ));
                }),
                backgroundColor: Colors.transparent,
                icon: Icons.edit_note,
                foregroundColor: Color.fromRGBO(254, 171, 46, 1),
              )*/
            ],
          ),
          endActionPane: ActionPane(
            motion: ScrollMotion(),
            children: [
              SlidableAction(
                onPressed: ((context) {
                  //print("${listAppToken[index].classToken_symb} delete");
                  showBarModalBottomSheet(
                      context: context,
                      backgroundColor: Colors.transparent,
                      builder: (ctx) => Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: Color.fromRGBO(10, 11, 10, 1),
                            ),
                            height: 150,
                            child: Center(
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: <Widget>[
                                  Text(
                                    'Are your really want delete ${listAppToken[index].classToken_name} ? ',
                                    style: TextStyle(
                                      fontSize: 15,
                                      color: Color.fromRGBO(254, 255, 254, 1),
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                  SizedBox(
                                    height: 20,
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      ElevatedButton(
                                        style: ElevatedButton.styleFrom(
                                            backgroundColor: Colors.transparent,
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(15),
                                            ),
                                            elevation: 0,
                                            shadowColor: Colors.transparent),
                                        onPressed: () {
                                          closeModal();
                                        },
                                        child: Text(
                                          "Cancel",
                                          style: TextStyle(
                                            fontSize: 17,
                                            color: Color.fromRGBO(
                                                254, 255, 254, 1),
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        width: 50,
                                      ),
                                      ElevatedButton(
                                        style: ElevatedButton.styleFrom(
                                          backgroundColor:
                                              Color.fromRGBO(255, 59, 89, 1),
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(15),
                                          ),
                                        ),
                                        onPressed: () => deleteItem(index),
                                        child: Text('Delete',
                                            style: TextStyle(
                                              fontSize: 17,
                                              color: Color.fromRGBO(
                                                  254, 255, 254, 1),
                                              fontWeight: FontWeight.w600,
                                            )),
                                      ),
                                    ],
                                  )
                                ],
                              ),
                            ),
                          ));
                }),
                backgroundColor: Colors.transparent,
                icon: Icons.delete,
                foregroundColor: Color.fromRGBO(255, 59, 89, 1),
              )
            ],
          ),
          child: Container(
            margin: EdgeInsets.only(top: 10, bottom: 10, left: 20, right: 20),
            //color: Colors.red,
            child: Row(
              children: [
                Column(
                  children: [
                    Image.asset(
                      'assets/images/${listAppToken[index].classToken_symb}.png',
                      width: 40,
                    )
                  ],
                ),
                SizedBox(
                  width: 20,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text(listAppToken[index].classToken_name.toString(),
                            style: TextStyle(
                              height: 1.5,
                              fontSize: 20,
                              color: Color.fromRGBO(254, 255, 254, 1),
                              fontWeight: FontWeight.w600,
                            ))
                      ],
                    ),
                    Row(
                      children: [
                        Column(
                          children: [
                            Text('\$${listAppToken[index].classToken_price}',
                                style: TextStyle(
                                  fontSize: 12,
                                  color: Color.fromRGBO(254, 255, 254, 1),
                                  fontWeight: FontWeight.w300,
                                )),
                          ],
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Column(
                          children: [
                            Text(
                              '${listAppToken[index].classToken_perc}%',
                              style: TextStyle(
                                  fontSize: 12,
                                  color: Color.fromRGBO(107, 181, 36, 1)),
                            )
                          ],
                        )
                      ],
                    )
                  ],
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                          '${listAppToken[index].classToken_quantity} ${listAppToken[index].classToken_symb}',
                          style: TextStyle(
                            fontSize: 20,
                            color: Color.fromRGBO(254, 255, 254, 1),
                            fontWeight: FontWeight.w600,
                          )),
                    ],
                  ),
                )
              ],
            ),
          ),
        );
      },
    );
  }

  void deleteItem(int index) {
    setState(() => listAppToken.removeAt(index));
    Navigator.pop(context);
  }

  void closeModal() {
    Navigator.pop(context);
  }
}
