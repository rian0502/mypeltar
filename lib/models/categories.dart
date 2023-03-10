import 'dart:convert';

Categories categoriesFromJson(String str) => Categories.fromJson(json.decode(str));

class Categories {
  int? id;
  String? kategori;
  int? idSubsatker;
  String? createdAt;
  String? updatedAt;

  Categories(
      {this.id,
        this.kategori,
        this.idSubsatker,
        this.createdAt,
        this.updatedAt});

  Categories.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    kategori = json['kategori'];
    idSubsatker = json['id_subsatker'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['kategori'] = kategori;
    data['id_subsatker'] = idSubsatker;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    return data;
  }
}