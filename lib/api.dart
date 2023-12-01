import 'dart:html';

class Autogenerated {
  int? id;
  String? categoryName;
  double? wholeSaleMargin;
  double? retailMargin;

  Autogenerated(Set<Object> set,
      {this.id, this.categoryName, this.wholeSaleMargin, this.retailMargin});

  Autogenerated.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    categoryName = json['categoryName'];
    wholeSaleMargin = json['wholeSaleMargin'];
    retailMargin = json['retailMargin'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = id;
    data['categoryName'] = this.categoryName;
    data['wholeSaleMargin'] = this.wholeSaleMargin;
    data['retailMargin'] = this.retailMargin;
    return data;
  }
}

class login {
  int? userId;
  String? pin;
  int? customerid;

  login({this.userId, this.pin, this.customerid});

  login.fromJson(Map<String, dynamic> json) {
    userId = json['userId'];
    pin = json['pin'];
    customerid = json['customerid'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['userId'] = this.userId;
    data['pin'] = this.pin;
    data['customerid'] = this.customerid;
    return data;
  }
}

class products {
  int? id;
  String? name;
  String? code;
  double? price;
  int? uom;
  double? costPrice;
  Null image;
  int? quantity;

  products(
      {this.id,
      this.name,
      this.code,
      this.price,
      this.uom,
      this.costPrice,
      this.quantity,
      this.image});

  products.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    code = json['code'];
    price = json['price'];
    uom = json['uom'];
    costPrice = json['costPrice'];
    image = json['image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['code'] = this.code;
    data['price'] = this.price;
    data['uom'] = this.uom;
    data['costPrice'] = this.costPrice;
    data['image'] = this.image;
    return data;
  }
}

class getCustomers {
  int? id;
  String? name;

  getCustomers({this.id, this.name});

  getCustomers.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    return data;
  }
}

// ignore: camel_case_types
class productOption {
  int? id;
  String? name;
  String? description;
  bool? priceApplicable;
  double? price;
  late bool selected;

  productOption(
      {this.id,
      this.name,
      this.description,
      this.priceApplicable,
      this.price,
      this.selected = false});

  productOption.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    description = json['description'];
    priceApplicable = json['priceApplicable'];
    price = json['price'];
    selected = false;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['description'] = this.description;
    data['priceApplicable'] = this.priceApplicable;
    data['price'] = this.price;
    data['selected'] = this.selected;
    return data;
  }
}

class servicesTable {
  int? id;
  String? name;
  late bool selected; // Mark 'selected' as late

  servicesTable(
      {this.id,
      this.name,
      this.selected = false}); // Initialize 'selected' with false

  servicesTable.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    selected = false; // Initialize 'selected' with false
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['selected'] = this.selected;
    return data;
  }
}

class getOrder {
  int? id;
  String? inv;
  String? customer;
  double? billAmount;

  getOrder({this.id, this.inv, this.customer, this.billAmount});

  getOrder.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    inv = json['inv'];
    customer = json['customer'];
    billAmount = json['billAmount'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['inv'] = this.inv;
    data['customer'] = this.customer;
    data['billAmount'] = this.billAmount;
    return data;
  }
}

class getSales {
  int? id;
  String? inv;
  String? customer;
  double? billAmount;

  getSales({this.id, this.inv, this.customer, this.billAmount});

  getSales.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    inv = json['inv'];
    customer = json['customer'];
    billAmount = json['billAmount'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['inv'] = this.inv;
    data['customer'] = this.customer;
    data['billAmount'] = this.billAmount;
    return data;
  }
}

class getTable {
  int? id;
  int? orderId;
  String? tableName;
  int? orderCount;
  double? totalAmount;

  getTable(
      {this.id,
      this.orderId,
      this.tableName,
      this.orderCount,
      this.totalAmount});

  getTable.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    orderId = json['orderId'];
    tableName = json['tableName'];
    orderCount = json['orderCount'];
    totalAmount = json['totalAmount'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['orderId'] = this.orderId;
    data['tableName'] = this.tableName;
    data['orderCount'] = this.orderCount;
    data['totalAmount'] = this.totalAmount;
    return data;
  }
}

class salesModel {
  int? saleId;
  int? customerId;
  String? trxDate;
  double? totalBillAmount;
  int? deliveredBy;
  String? paymentMode;
  int? typeofservice;
  String? contactna;
  String? contactnumber;
  int? tableid;
  int? orderby;
  List<Detail>? detail;
  bool? print;

  salesModel(
      {this.saleId,
      this.customerId,
      this.trxDate,
      this.totalBillAmount,
      this.deliveredBy,
      this.paymentMode,
      this.typeofservice,
      this.contactna,
      this.contactnumber,
      this.tableid,
      this.orderby,
      this.detail,
      this.print});

  salesModel.fromJson(Map<String, dynamic> json) {
    saleId = json['saleId'];
    customerId = json['customerId'];
    printval("custid" + customerId.toString());
    trxDate = json['trxDate'];
    printval("trxdate" + trxDate.toString());
    totalBillAmount = json['totalBillAmount'];
    printval("totalBillAmount" + totalBillAmount.toString());
    deliveredBy = json['deliveredBy'];
    paymentMode = json['paymentMode'];
    typeofservice = json['typeofservice'];
    contactna = json['contactna'];
    contactnumber = json['contactnumber'];
    tableid = json['tableid'];
    orderby = json['orderby'];
    if (json['detail'] != null) {
      detail = <Detail>[];
      json['detail'].forEach((v) {
        detail!.add(new Detail.fromJson(v));
      });
    }
    print = json['print'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['SaleId'] = this.saleId;
    data['CustomerId'] = this.customerId;
    data['TrxDate'] = this.trxDate;
    data['TotalBillAmount'] = this.totalBillAmount;
    data['DeliveredBy'] = this.deliveredBy;
    data['PaymentMode'] = this.paymentMode;
    data['typeofservice'] = this.typeofservice;
    data['contactna'] = this.contactna;
    data['contactnumber'] = this.contactnumber;
    data['tableid'] = this.tableid;
    data['orderby'] = this.orderby;
    if (this.detail != null) {
      data['Detail'] = this.detail!.map((v) => v.toJson()).toList();
    }
    data['print'] = this.print;
    return data;
  }
}

class Detail {
  int? id;
  int? saleId;
  int? productId;
  String? productName;
  double? amount;
  int? quantity;
  double? lineTotal;
  int? optionTotal;
  String? options;
  int? uom;
  double? costPrice;

  Detail(
      {this.id,
      this.saleId,
      this.productId,
      this.productName,
      this.amount,
      this.quantity,
      this.lineTotal,
      this.optionTotal,
      this.options,
      this.uom,
      this.costPrice});

  Detail.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    saleId = json['saleId'];
    productId = json['productId'];
    productName = json['productName'];
    amount = json['amount'];
    quantity = json['quantity'];
    lineTotal = json['lineTotal'];
    options = json['options'];
    uom = json['uom'];
    costPrice = json['costPrice'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Id'] = this.id;
    data['SaleId'] = this.saleId;
    data['ProductId'] = this.productId;
    data['ProductName'] = this.productName;
    data['Amount'] = this.amount;
    data['Quantity'] = this.quantity;
    data['LineTotal'] = this.lineTotal;
    data['OptionTotal'] = this.optionTotal;
    data['Options'] = this.options;
    data['Uom'] = this.uom;
    data['CostPrice'] = this.costPrice;
    return data;
  }
}

printval(val) {
  print(val);
}
