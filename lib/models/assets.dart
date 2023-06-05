import 'dart:convert';

Assets assetsFromJson(String str) => Assets.fromJson(json.decode(str));

class Assets {
  String? status;
  List<Asset>? asset;

  Assets({status, asset});

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
  String? codeAsset;
  String? serialnumber;
  String? namaAsset;
  String? merk;
  String? model;
  String? spesifikasi;
  String? deskripsi;
  Lokasi? lokasi;
  List<Kategori>? kategori;
  String? status;
  String? updatedAt;
  String? createdAt;

  Asset(
      {id,
        stockcode,
        codeAsset,
        serialnumber,
        namaAsset,
        merk,
        model,
        spesifikasi,
        deskripsi,
        lokasi,
        kategori,
        status,
        updatedAt,
        createdAt});

  Asset.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    stockcode = json['stockcode'];
    codeAsset = json['code_asset'];
    serialnumber = json['serialnumber'];
    namaAsset = json['nama_asset'];
    merk = json['merk'];
    model = json['model'];
    spesifikasi = json['spesifikasi'];
    deskripsi = json['deskripsi'];
    lokasi =
    json['lokasi'] != null ? Lokasi.fromJson(json['lokasi']) : null;
    if (json['kategori'] != null) {
      kategori = <Kategori>[];
      json['kategori'].forEach((v) {
        kategori!.add(Kategori.fromJson(v));
      });
    }
    status = json['status'];
    updatedAt = json['updated_at'];
    createdAt = json['created_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['stockcode'] = stockcode;
    data['code_asset'] = codeAsset;
    data['serialnumber'] = serialnumber;
    data['nama_asset'] = namaAsset;
    data['merk'] = merk;
    data['model'] = model;
    data['spesifikasi'] = spesifikasi;
    data['deskripsi'] = deskripsi;
    if (lokasi != null) {
      data['lokasi'] = lokasi!.toJson();
    }
    if (kategori != null) {
      data['kategori'] = kategori!.map((v) => v.toJson()).toList();
    }
    data['status'] = status;
    data['updated_at'] = updatedAt;
    data['created_at'] = createdAt;
    return data;
  }
}

class Lokasi {
  int? id;
  String? unit;
  String? createdAt;
  String? updatedAt;

  Lokasi({id, unit, createdAt, updatedAt});

  Lokasi.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    unit = json['unit'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['unit'] = unit;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
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
      {id,
        kategori,
        idSubsatker,
        createdAt,
        updatedAt,
        pivot});

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

  Pivot({assetId, categoryId});

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