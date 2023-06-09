import 'dart:convert';

Maintenance maintenanceFromJson(String str) => Maintenance.fromJson(json.decode(str));

class Maintenance {
  int? id;
  UserInspektor? userInspektor;
  Asset? asset;
  Type? type;
  String? imagebefore;
  String? imageafter;
  List<History>? history;

  Maintenance(
      {this.id,
        this.userInspektor,
        this.asset,
        this.type,
        this.imagebefore,
        this.imageafter,
        this.history});

  Maintenance.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userInspektor = json['user_inspektor'] != null
        ? UserInspektor.fromJson(json['user_inspektor'])
        : null;
    asset = json['asset'] != null ? Asset.fromJson(json['asset']) : null;
    type = json['type'] != null ? Type.fromJson(json['type']) : null;
    imagebefore = json['imagebefore'];
    imageafter = json['imageafter'];
    if (json['history'] != null) {
      history = <History>[];
      json['history'].forEach((v) {
        history!.add(History.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    if (userInspektor != null) {
      data['user_inspektor'] = userInspektor!.toJson();
    }
    if (asset != null) {
      data['asset'] = asset!.toJson();
    }
    if (type != null) {
      data['type'] = type!.toJson();
    }
    data['imagebefore'] = imagebefore;
    data['imageafter'] = imageafter;
    if (history != null) {
      data['history'] = history!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class UserInspektor {
  String? nama;
  String? email;
  String? username;
  List<String>? role;
  Subsatker? subsatker;
  Satker? satker;

  UserInspektor(
      {this.nama,
        this.email,
        this.username,
        this.role,
        this.subsatker,
        this.satker});

  UserInspektor.fromJson(Map<String, dynamic> json) {
    nama = json['nama'];
    email = json['email'];
    username = json['username'];
    role = json['role'].cast<String>();
    subsatker = json['subsatker'] != null
        ? Subsatker.fromJson(json['subsatker'])
        : null;
    satker =
    json['satker'] != null ? Satker.fromJson(json['satker']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['nama'] = nama;
    data['email'] = email;
    data['username'] = username;
    data['role'] = role;
    if (subsatker != null) {
      data['subsatker'] = subsatker!.toJson();
    }
    if (satker != null) {
      data['satker'] = satker!.toJson();
    }
    return data;
  }
}

class Subsatker {
  int? id;
  String? subsatker;

  Subsatker({this.id, this.subsatker});

  Subsatker.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    subsatker = json['subsatker'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['subsatker'] = subsatker;
    return data;
  }
}

class Satker {
  int? id;
  String? satker;

  Satker({this.id, this.satker});

  Satker.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    satker = json['satker'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =  <String, dynamic>{};
    data['id'] = id;
    data['satker'] = satker;
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
      {this.id,
        this.stockcode,
        this.codeAsset,
        this.serialnumber,
        this.namaAsset,
        this.merk,
        this.model,
        this.spesifikasi,
        this.deskripsi,
        this.lokasi,
        this.kategori,
        this.status,
        this.updatedAt,
        this.createdAt});

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

  Lokasi({this.id, this.unit, this.createdAt, this.updatedAt});

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

class Type {
  int? id;
  String? type;

  Type({this.id, this.type});

  Type.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    type = json['type'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['type'] = type;
    return data;
  }
}

class History {
  int? id;
  String? user;
  String? status;
  String? deskripsi;
  String? image;
  String? createdAt;
  String? updateAt;

  History(
      {this.id,
        this.user,
        this.status,
        this.deskripsi,
        this.image,
        this.createdAt,
        this.updateAt});

  History.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    user = json['user'];
    status = json['status'];
    deskripsi = json['deskripsi'];
    image = json['image'];
    createdAt = json['created_at'];
    updateAt = json['update_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['user'] = user;
    data['status'] = status;
    data['deskripsi'] = deskripsi;
    data['image'] = image;
    data['created_at'] = createdAt;
    data['update_at'] = updateAt;
    return data;
  }
}