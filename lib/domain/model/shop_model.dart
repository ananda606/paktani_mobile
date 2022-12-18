import 'dart:convert';

class ShopModel {
  int idShop;
  String shopName;

  ShopModel({
    required this.idShop,
    required this.shopName,
  });
  factory ShopModel.fromJson(Map<String, dynamic> map) {
    return ShopModel(
      idShop: map['idShop'],
      shopName: map['shopName'],
    );
  }
  Map<String, dynamic> toJson() {
    return {
      'idShop': idShop,
      'shopName': shopName,
    };
  }

  @override
  String toString() {
    return 'ProductModel{idShop: $idShop, shopName: $shopName,  }';
  }
}

List<ShopModel> productFromJson(String jsonData) {
  final data = json.decode(jsonData);
  return List<ShopModel>.from(data.map((item) => ShopModel.fromJson(item)));
}

String productToJson(ShopModel data) {
  final jsonData = data.toJson();
  return json.encode(jsonData);
}
