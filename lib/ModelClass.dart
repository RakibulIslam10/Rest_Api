class Productkey {
  String? sId;
  String? productName;
  String? productCode;
  String? img;
  String? unitPrice;
  String? qty;
  String? totalPrice;
  String? createdDate;

  Productkey(
      {this.sId,
        this.productName,
        this.productCode,
        this.img,
        this.unitPrice,
        this.qty,
        this.totalPrice,
        this.createdDate});

  Productkey.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    productName = json['ProductName'];
    productCode = json['ProductCode'];
    img = json['Img'];
    unitPrice = json['UnitPrice'];
    qty = json['Qty'];
    totalPrice = json['TotalPrice'];
    createdDate = json['CreatedDate'];
  }}