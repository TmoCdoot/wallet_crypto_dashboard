class classToken {
  String? classToken_id;
  String? classToken_name;
  String? classToken_price;
  String? classToken_perc;
  String? classToken_quantity;
  String? classToken_symb;

  classToken(String id, String name, String price, String perc, String quantity, String symb) {
    classToken_id = id;
    classToken_name = name;
    classToken_price = price;
    classToken_perc = perc;
    classToken_quantity = quantity;
    classToken_symb = symb;
  }

  classToken.fromSnapshot(snapshot) {
    classToken_id = snapshot['id'];
    classToken_name = snapshot['name'];
    classToken_price = snapshot['price'];
    classToken_perc = snapshot['perc'];
    classToken_quantity = snapshot['quantity'];
    classToken_symb = snapshot['symb'];
  } 
  
}