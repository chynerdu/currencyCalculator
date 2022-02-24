class CurrencyModel {
  String? currencyName;
  String? currencySymbol;
  String? id;

  CurrencyModel({this.currencyName, this.currencySymbol, this.id});

  CurrencyModel.fromJson(Map<String, dynamic> json) {
    currencyName = json['currencyName'];
    currencySymbol = json['currencySymbol'] ?? '-';
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['currencyName'] = this.currencyName;
    data['currencySymbol'] = this.currencySymbol ?? '-';
    data['id'] = this.id;
    return data;
  }
}
