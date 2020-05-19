import 'dart:convert';

List<ProductListModel> productListModelFromJson(String str) => List<ProductListModel>.from(json.decode(str).map((x) => ProductListModel.fromJson(x)));

String productListModelToJson(List<ProductListModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ProductListModel {
    String title;
    bool purchased;
    double amount;
    int count;
    DateTime created;
    double price;
    String productId;
    String id;
    String category;

    ProductListModel({
        this.title,
        this.purchased,
        this.amount,
        this.count,
        this.created,
        this.price,
        this.productId,
        this.id,
        this.category
    });

    factory ProductListModel.fromJson(Map<String, dynamic> json) => ProductListModel(
        title: json["title"] == null ? null : json["title"],
        purchased: json["purchased"] == null ? null : json["purchased"],
        amount: json["amount"] == null ? null : json["amount"],
        count: json["count"] == null ? null : json["count"],
        created: json["created"] == null ? null : DateTime.parse(json["created"]),
        price: json["price"] == null ? null : json["price"],
        productId: json["product_id"] == null ? null : json["product_id"],
        id: json["id"] == null ? null : json["id"],
        category: json["category"] == null ? null : json["category"],
    );

    Map<String, dynamic> toJson() => {
        "title": title == null ? null : title,
        "purchased": purchased == null ? null : purchased,
        "amount": amount == null ? null : amount,
        "count": count == null ? null : count,
        "created": created == null ? null : created.toIso8601String(),
        "price": price == null ? null : price,
        "product_id": productId == null ? null : productId,
        "id": id == null ? null : id,
        "category": category == null ? null : category,
    };
}
