import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:wallet_crypto_dashboard/class/classNft.class.dart';
import 'package:wallet_crypto_dashboard/class/classToken.class.dart';
import 'package:wallet_crypto_dashboard/modals/editUserToken.modals.dart';

class userCollectiblesList extends StatefulWidget {
  const userCollectiblesList({super.key});

  @override
  State<userCollectiblesList> createState() => _userCollectiblesList();
}

class _userCollectiblesList extends State<userCollectiblesList> {
  static const List<Map<String, dynamic>> listTest = [
    {
      'blockchain': 'Ethereum',
      'buyPrice': '2,768',
      'metaData': '{"id":"23", "genre":"male", "coun":"2"}',
      'collectionName': 'Boared Apec',
      'imgLink': 'nft1'
    },
    {
      'blockchain': 'Bitcoin',
      'buyPrice': '0.23',
      'metaData': '[]',
      'imgLink': 'nft2'
    },
    {
      'blockchain': 'Solana',
      'buyPrice': '18.98',
      'metaData': '[]',
      'imgLink': 'nft3'
    },
    {
      'blockchain': 'Ethereum',
      'buyPrice': '10,300',
      'metaData': '[]',
      'imgLink': 'nft4'
    },
  ];

  List<classNft> listUserCollectibles =
      List.from(listTest.map((doc) => classNft.fromSnapshot(doc)));

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      physics: NeverScrollableScrollPhysics(), //prend la physique du parent
      padding: EdgeInsets.zero,
      shrinkWrap: true,
      itemCount: listUserCollectibles.length,
      itemBuilder: (context, index) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              margin: EdgeInsets.only(top: 10, bottom: 30, left: 20, right: 20),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: Colors.red,
              ),
              width: 250,
              child: Column(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.only(topLeft: Radius.circular(12),topRight: Radius.circular(12)),
                    child: Image.asset(
                      'assets/images/${listUserCollectibles[index].classNft_imgLink}.png',
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text("${listUserCollectibles[index].classNft_metaData}",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                      )),
                ],
              ),
            ),
          ],
        );
      },
    );
  }

  /*void deleteItemUserStorage(int index) {
    setState(() => listAppToken.removeAt(index));
    Navigator.pop(context);
  }

  void closeModalWithNoAction() {
    Navigator.pop(context);
  }*/
}
