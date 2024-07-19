import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:wallet_crypto_dashboard/pages/class/classToken.dart';

class editUserToken extends StatefulWidget {
  final classToken userTokenSelect;

  const editUserToken(
      {super.key, required this.userTokenSelect});

  @override
  State<editUserToken> createState() => _editUserToken(userTokenSelect: userTokenSelect);
}

class _editUserToken extends State<editUserToken> {
  _editUserToken({required this.userTokenSelect});

  var quantityUserToken = TextEditingController();
  var buyPriceUserToken = TextEditingController();
  classToken userTokenSelect;
  
  @override
  void initState() {
    super.initState();
    buyPriceUserToken = TextEditingController(text: userTokenSelect.classToken_price);
    quantityUserToken = TextEditingController(text: userTokenSelect.classToken_quantity);
  }
  

  @override
  Widget build(BuildContext context) {
    return SlidableAction(
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
                        'Edit ${widget.userTokenSelect.classToken_name}',
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
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text("Quantity",
                                        style: TextStyle(
                                          fontSize: 14,
                                          color:
                                              Color.fromRGBO(168, 168, 172, 1),
                                          fontWeight: FontWeight.w600,
                                        )),
                                    Container(
                                      child: Row(
                                        children: [
                                          SizedBox(
                                            width: 230,
                                            child: TextField(
                                              controller: quantityUserToken,
                                              autofocus: true,
                                              keyboardType: TextInputType
                                                  .numberWithOptions(
                                                      decimal: true),
                                              decoration: InputDecoration(
                                                border: InputBorder.none,
                                              ),
                                              style: TextStyle(
                                                color: Colors.white,
                                                fontWeight: FontWeight.w800,
                                                fontSize: 40,
                                              ),
                                            ),
                                          ),
                                          Container(
                                            child: Row(
                                              children: [
                                                Image.asset(
                                                  'assets/images/${widget.userTokenSelect.classToken_symb}.png',
                                                  width: 40,
                                                ),
                                                Container(
                                                  padding:
                                                      EdgeInsets.only(left: 10),
                                                  child: Text(
                                                    "${widget.userTokenSelect.classToken_symb}",
                                                    style: TextStyle(
                                                        fontSize: 16,
                                                        color: Colors.white,
                                                        fontWeight:
                                                            FontWeight.w700),
                                                  ),
                                                )
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Text(
                                        '1 ${widget.userTokenSelect.classToken_symb} ≈ 3290.90 \$ ',
                                        style: TextStyle(
                                          fontSize: 14,
                                          color:
                                              Color.fromARGB(255, 59, 61, 66),
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
                                          color:
                                              Color.fromRGBO(29, 28, 31, 1)))),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
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
                                            fontWeight: FontWeight.w600,
                                          )),
                                      Container(
                                        child: Row(
                                          children: [
                                            SizedBox(
                                              width: 300,
                                              child: TextField(
                                                controller: buyPriceUserToken,
                                                keyboardType: TextInputType
                                                    .numberWithOptions(
                                                        decimal: true),
                                                decoration: InputDecoration(
                                                    border: InputBorder.none),
                                                style: TextStyle(
                                                  color: Colors.white,
                                                  fontWeight: FontWeight.w800,
                                                  fontSize: 40,
                                                ),
                                              ),
                                            ),
                                            Container(
                                              padding:
                                                  EdgeInsets.only(left: 10),
                                              child: Text(
                                                "\$",
                                                style: TextStyle(
                                                    fontSize: 18,
                                                    color: Colors.white,
                                                    fontWeight:
                                                        FontWeight.w700),
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
                            backgroundColor: Color.fromRGBO(54, 205, 120, 1),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15),
                            ),
                          ),
                          onPressed: () => editToken(),
                          child: Text('Save Token',
                              style: TextStyle(
                                fontSize: 17,
                                color: Color.fromRGBO(254, 255, 254, 1),
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
    );
  }

  void editToken() {
    print(quantityUserToken.text);
    print(buyPriceUserToken.text);
    buyPriceUserToken.clear();
    quantityUserToken.clear();
    Navigator.pop(context);
  }
}
