import 'dart:convert';

List<ShoppingListModel> listModelFromJson(String str) => List<ShoppingListModel>.from(json.decode(str).map((x) => ShoppingListModel.fromJson(x)));

String listModelToJson(List<ShoppingListModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ShoppingListModel {
    DateTime created;
    String title;
    String id;

    ShoppingListModel({
        this.created,
        this.title,
        this.id,
    });

    factory ShoppingListModel.fromJson(Map<String, dynamic> json) => ShoppingListModel(
        created: json["created"] == null ? null : DateTime.parse(json["created"]),
        title: json["title"] == null ? null : json["title"],
        id: json["id"] == null ? null : json["id"],
    );

    Map<String, dynamic> toJson() => {
        "created": created == null ? null : created.toIso8601String(),
        "title": title == null ? null : title,
        "id": id == null ? null : id,
    };
}
