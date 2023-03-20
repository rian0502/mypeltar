
import 'dart:convert';

Login loginFromJson(String str) => Login.fromJson(json.decode(str));


class Login {
  String? status;
  User? user;
  Authorisation? authorisation;

  Login({this.status, this.user, this.authorisation});

  Login.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    user = json['user'] != null ? new User.fromJson(json['user']) : null;
    authorisation = json['authorisation'] != null
        ? new Authorisation.fromJson(json['authorisation'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    if (this.user != null) {
      data['user'] = this.user!.toJson();
    }
    if (this.authorisation != null) {
      data['authorisation'] = this.authorisation!.toJson();
    }
    return data;
  }
}

class User {
  String? nama;
  String? email;
  String? username;
  Role? role;
  Satker? satker;
  String? subsatker;

  User(
      {this.nama,
        this.email,
        this.username,
        this.role,
        this.satker,
        this.subsatker});

  User.fromJson(Map<String, dynamic> json) {
    nama = json['nama'];
    email = json['email'];
    username = json['username'];
    role = json['role'] != null ? Role.fromJson(json['role']) : null;
    satker =
    json['satker'] != null ? Satker.fromJson(json['satker']) : null;
    subsatker = json['subsatker'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['nama'] = nama;
    data['email'] = email;
    data['username'] = username;
    if (role != null) {
      data['role'] = role!.toJson();
    }
    if (satker != null) {
      data['satker'] = satker!.toJson();
    }
    data['subsatker'] = subsatker;
    return data;
  }
}

class Role {
  int? id;
  String? role;
  String? createdAt;
  String? updatedAt;

  Role({this.id, this.role, this.createdAt, this.updatedAt});

  Role.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    role = json['role'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['role'] = this.role;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}

class Satker {
  int? id;
  String? satker;
  String? createdAt;
  String? updatedAt;

  Satker({this.id, this.satker, this.createdAt, this.updatedAt});

  Satker.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    satker = json['satker'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['satker'] = this.satker;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}

class Authorisation {
  String? token;
  String? type;

  Authorisation({this.token, this.type});

  Authorisation.fromJson(Map<String, dynamic> json) {
    token = json['token'];
    type = json['type'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['token'] = this.token;
    data['type'] = this.type;
    return data;
  }
}