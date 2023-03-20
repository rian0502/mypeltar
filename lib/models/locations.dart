
import 'dart:convert';

Locations locationsFromJson(String str) => Locations.fromJson(json.decode(str));

class Locations {
  int? id;
  String? unit;
  String? createdAt;
  String? updatedAt;

  Locations({this.id, this.unit, this.createdAt, this.updatedAt});

  Locations.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    unit = json['unit'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['unit'] = unit;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}