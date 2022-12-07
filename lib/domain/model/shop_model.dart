import 'dart:convert';
import 'dart:ffi';

class ShopModel {
  int idShop;
  String shopName;
  List<int>? idProduct;
 ShopModel({
    required this.idShop,
  this.idProduct,
required this.shopName,
    
  });
  factory ShopModel.fromJson(Map<String, dynamic> map) {
    return ShopModel(
      idShop: map['idShop'],
      shopName: map['shopName'],
      idProduct: map['idProduct'],
    );
  }
  Map<String, dynamic> toJson() {
    return {
      'idShop': idShop,
      'shopName': shopName,
      'idProduct': idProduct,
      
    };
  }

  @override
  String toString() {
    return 'ProductModel{idShop: $idShop, shopName: $shopName, idProduct: $idProduct, }';
  }
}

List<ShopModel> productFromJson(String jsonData) {
  final data = json.decode(jsonData);
  return List<ShopModel>.from(
      data.map((item) => ShopModel.fromJson(item)));
}

String productToJson(ShopModel data) {
  final jsonData = data.toJson();
  return json.encode(jsonData);
}
