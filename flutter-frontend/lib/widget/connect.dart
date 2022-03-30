class Invest {
  int stockabreviation;
  String amount;
  String buyvalue;
  String description;

  Invest.fromJson(Map json)
      : stockabreviation = json['stock_abreviation'],
        amount = json['amount'],
        buyvalue = json['buy_value'],
        description = json['description'];

  Map toJson() {
    return {
      'stock_abreviation': stockabreviation,
      'amount': amount,
      'buy_value': buyvalue,
      'description': description
    };
  }
}
