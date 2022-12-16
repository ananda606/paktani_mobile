import 'dart:convert';

class MoneyModel {
  int? idMoney;
  int amount;
  MoneyModel({
    this.idMoney,
    required this.amount,
  });
  factory MoneyModel.fromJson(Map<String, dynamic> map) {
    return MoneyModel(amount: map['amount']);
  }
  Map<String, dynamic> toJson() {
    return {
      'amount': amount,
    };
  }
}

List<MoneyModel> moneyFromJson(String jsonData) {
  final data = json.decode(jsonData);
  return List<MoneyModel>.from(data.map((item) => MoneyModel.fromJson(item)));
}

String moneyToJson(MoneyModel data) {
  final jsonData = data.toJson();
  return json.encode(jsonData);
}
