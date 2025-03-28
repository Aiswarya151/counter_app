// To parse this JSON data, do
//
//     final counter = counterFromJson(jsonString);

import 'dart:convert';

List<Counter> counterFromJson(String str) => List<Counter>.from(json.decode(str).map((x) => Counter.fromJson(x)));

String counterToJson(List<Counter> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Counter {
    String? id;
    String? title;
    int? count;
    DateTime? createdAt;
    DateTime? updatedAt;
    int? v;

    Counter({
        this.id,
        this.title,
        this.count,
        this.createdAt,
        this.updatedAt,
        this.v,
    });

    factory Counter.fromJson(Map<String, dynamic> json) => Counter(
        id: json["_id"],
        title: json["title"],
        count: json["count"],
        createdAt: json["createdAt"] == null ? null : DateTime.parse(json["createdAt"]),
        updatedAt: json["updatedAt"] == null ? null : DateTime.parse(json["updatedAt"]),
        v: json["__v"],
    );

    Map<String, dynamic> toJson() => {
        "_id": id,
        "title": title,
        "count": count,
        "createdAt": createdAt?.toIso8601String(),
        "updatedAt": updatedAt?.toIso8601String(),
        "__v": v,
    };
}
