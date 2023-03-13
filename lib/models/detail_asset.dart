import 'dart:convert';

DetailAsset detailAssetFromJson(String str) =>
    DetailAsset.fromJson(json.decode(str));

class DetailAsset {
  int? id;
  String? stockcode;
  String? serialnumber;
  String? namaAsset;
  String? merk;
  String? model;
  String? spesifikasi;
  String? deskripsi;
  String? lokasi;
  List<Kategori>? kategori;
  Status? status;

  DetailAsset(
      {this.id,
        this.stockcode,
        this.serialnumber,
        this.namaAsset,
        this.merk,
        this.model,
        this.spesifikasi,
        this.deskripsi,
        this.lokasi,
        this.kategori,
        this.status});

  DetailAsset.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    stockcode = json['stockcode'];
    serialnumber = json['serialnumber'];
    namaAsset = json['nama_asset'];
    merk = json['merk'];
    model = json['model'];
    spesifikasi = json['spesifikasi'];
    deskripsi = json['deskripsi'];
    lokasi = json['lokasi'];
    if (json['kategori'] != null) {
      kategori = <Kategori>[];
      json['kategori'].forEach((v) {
        kategori!.add(Kategori.fromJson(v));
      });
    }
    status =
    json['status'] != null ? Status.fromJson(json['status']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['stockcode'] = stockcode;
    data['serialnumber'] = serialnumber;
    data['nama_asset'] = namaAsset;
    data['merk'] = merk;
    data['model'] = model;
    data['spesifikasi'] = spesifikasi;
    data['deskripsi'] = deskripsi;
    data['lokasi'] = lokasi;
    if (kategori != null) {
      data['kategori'] = kategori!.map((v) => v.toJson()).toList();
    }
    if (status != null) {
      data['status'] = status!.toJson();
    }
    return data;
  }
}

class Kategori {
  int? id;
  String? kategori;
  int? idSubsatker;
  String? createdAt;
  String? updatedAt;
  Pivot? pivot;

  Kategori(
      {this.id,
        this.kategori,
        this.idSubsatker,
        this.createdAt,
        this.updatedAt,
        this.pivot});

  Kategori.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    kategori = json['kategori'];
    idSubsatker = json['id_subsatker'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    pivot = json['pivot'] != null ? Pivot.fromJson(json['pivot']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['kategori'] = kategori;
    data['id_subsatker'] = idSubsatker;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    if (pivot != null) {
      data['pivot'] = pivot!.toJson();
    }
    return data;
  }
}

class Pivot {
  int? assetId;
  int? categoryId;

  Pivot({this.assetId, this.categoryId});

  Pivot.fromJson(Map<String, dynamic> json) {
    assetId = json['asset_id'];
    categoryId = json['category_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['asset_id'] = assetId;
    data['category_id'] = categoryId;
    return data;
  }
}

class Status {
  int? id;
  String? statuscode;
  String? status;
  String? createdAt;
  String? updatedAt;

  Status(
      {this.id, this.statuscode, this.status, this.createdAt, this.updatedAt});

  Status.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    statuscode = json['statuscode'];
    status = json['status'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['statuscode'] = statuscode;
    data['status'] = status;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    return data;
  }
}