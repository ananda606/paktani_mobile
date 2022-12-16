import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:paktani_mobile/domain/model/money_model.dart';

class MoneyApi {
  final String url = "http://10.0.2.2:3001/api";
  Client client = Client();

 Future<List<MoneyModel>?> getMoney() async {
    final response = await client.get(Uri.parse("$url/readMoney"));
    if (response.statusCode == 200) {
      return moneyFromJson(response.body);
    } else {
      return null;
    }
  }

  Future<bool> updateMoneyAmount(MoneyModel data) async {
    final response = await client.put(
      Uri.parse("$url/api/updateMoneyById/${data.idMoney}"),
      headers: {"content-type": "application/json"},
      body: moneyToJson(data),
    );
    if (response.statusCode == 200) {
      return true;
    } else {
      return false;
    }
  }
}
