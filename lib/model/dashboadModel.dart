class DashBoardModel {
  var symbol;
  var name;
  var price;
  var exchange;
  var exchangeShortName;
  var type;

  DashBoardModel(
      {this.symbol,
        this.name,
        this.price,
        this.exchange,
        this.exchangeShortName,
        this.type});

  DashBoardModel.fromJson(Map<String, dynamic> json) {
    symbol = json['symbol'];
    name = json['name'];
    price = json['price'];
    exchange = json['exchange'];
    exchangeShortName = json['exchangeShortName'];
    type = json['type'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['symbol'] = this.symbol;
    data['name'] = this.name;
    data['price'] = this.price;
    data['exchange'] = this.exchange;
    data['exchangeShortName'] = this.exchangeShortName;
    data['type'] = this.type;
    return data;
  }
}