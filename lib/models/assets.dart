import 'dart:convert';

Assets assetsFromJson(String str) => Assets.fromJson(json.decode(str));

class Assets {
  String? status;
  List<Asset>? asset;

  Assets({this.status, this.asset});

  Assets.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    if (json['asset'] != null) {
      asset = <Asset>[];
      json['asset'].forEach((v) {
        asset!.add(Asset.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    if (asset != null) {
      data['asset'] = asset!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Asset {
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

  Asset(
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

  Asset.fromJson(Map<String, dynamic> json) {
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
    }else{
      kategori = null;
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
    pivot = json['pivot'] != null ? new Pivot.fromJson(json['pivot']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['kategori'] = this.kategori;
    data['id_subsatker'] = this.idSubsatker;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    if (this.pivot != null) {
      data['pivot'] = this.pivot!.toJson();
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
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['statuscode'] = this.statuscode;
    data['status'] = this.status;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}