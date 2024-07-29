import 'package:flutter/material.dart';
import 'package:wallet_crypto_dashboard/class/classToken.class.dart';

class formAddToken extends StatefulWidget {
  final classToken listTokenForRender;

  const formAddToken({super.key, required this.listTokenForRender});

  @override
  State<formAddToken> createState() => _formAddToken();
}

class _formAddToken extends State<formAddToken> {
  final buyPriceTokenFromUser = TextEditingController();
  final quantityTokenFromUser = TextEditingController();

  @override
  Widget build(BuildContext context) {
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
                onTap: () => {Navigator.pop(context)},
                child: Container(
                  alignment: Alignment.topLeft,
                  width: 50,
                  height: 20,
                  decoration: BoxDecoration(),
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
          SizedBox(
            height: 20,
          ),
          Row(
            children: <Widget>[
              Container(
                width: 200,
                child: TextFormField(
                  controller: quantityTokenFromUser,
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
                  keyboardType: TextInputType.numberWithOptions(decimal: true),
                ),
              ),
              SizedBox(
                width: 10,
              ),
              Text(
                '${widget.listTokenForRender.classToken_symb}',
                style: TextStyle(
                    fontSize: 40,
                    color: Colors.white,
                    fontWeight: FontWeight.w700),
              ),
              SizedBox(
                height: 15,
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'assets/images/switch.png',
                width: 20,
              ),
              SizedBox(
                width: 10,
              ),
              Text(
                "\$2,899.08",
                style: TextStyle(
                  fontSize: 12,
                  color: Color.fromARGB(255, 59, 61, 66),
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
          SizedBox(
            height: 30
          ),
          Row(
            children: [
              Text(
                "Buy Price",
                style: TextStyle(
                  fontSize: 15,
                  color: Color.fromRGBO(254, 255, 254, 1),
                  fontWeight: FontWeight.w700,
                ),
              ),
            ],
          ),
          SizedBox(
            height: 5,
          ),
          TextField(
            controller: buyPriceTokenFromUser,
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
          SizedBox(
            height: 40,
          ),
          Container(
            width: 400,
            height: 60,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Color.fromRGBO(54, 205, 120, 1),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
              ),
              onPressed: () => addTokenOnUserStorage(widget.listTokenForRender),
              child: Text('Add Token',
                  style: TextStyle(
                    fontSize: 17,
                    color: Color.fromRGBO(254, 255, 254, 1),
                    fontWeight: FontWeight.w600,
                  )),
            ),
          ),
        ],
      ),
    );
  }

  void addTokenOnUserStorage(classToken listTokenForRender) {
    print(buyPriceTokenFromUser.text);
    print(quantityTokenFromUser.text);
    print(listTokenForRender.classToken_name);

    quantityTokenFromUser.clear();
    buyPriceTokenFromUser.clear();
    Navigator.pop(context);
    Navigator.pop(context);
  }
}
