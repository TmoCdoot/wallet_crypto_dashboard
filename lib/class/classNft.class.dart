class classNft {
  String? classNft_blockchain;
  String? classNft_buyPrice;
  Object? classNft_metaData;
  String? classNft_collectionName;
  String? classNft_imgLink;

  classNft(String blockChain, String buyprice, Object metaData, String collectionName, String imgLink) {
    classNft_blockchain = blockChain;
    classNft_buyPrice = buyprice;
    classNft_metaData = metaData;
    classNft_collectionName = collectionName;
    classNft_imgLink = imgLink;
  }

  classNft.fromSnapshot(snapshot) {
    classNft_blockchain = snapshot['blockchain'];
    classNft_buyPrice = snapshot['buyPrice'];
    classNft_metaData = snapshot['metaData'];
    classNft_collectionName = snapshot['collectionName'];
    classNft_imgLink = snapshot['imgLink'];
  } 
  
}