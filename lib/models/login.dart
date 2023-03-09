

import 'dart:convert';

Login loginFromJson(String str) => Login.fromJson(json.decode(str));


class Login {
  String? status;
  User? user;
  Authorisation? authorisation;

  Login({this.status, this.user, this.authorisation});

  Login.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    user = json['user'] != null ? User.fromJson(json['user']) : null;
    authorisation = json['authorisation'] != null
        ? Authorisation.fromJson(json['authorisation'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    if (user != null) {
      data['user'] = user!.toJson();
    }
    if (authorisation != null) {
      data['authorisation'] = authorisation!.toJson();
    }
    return data;
  }
}

class User {
  String? nama;
  String? email;
  String? username;
  String? role;
  String? satker;
  String? subSatker;

  User(
      {this.nama,
        this.email,
        this.username,
        this.role,
        this.satker,
        this.subSatker});

  User.fromJson(Map<String, dynamic> json) {
    nama = json['Nama'];
    email = json['Email'];
    username = json['Username'];
    role = json['Role'];
    satker = json['Satker'];
    subSatker = json['SubSatker'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Nama'] = this.nama;
    data['Email'] = this.email;
    data['Username'] = this.username;
    data['Role'] = this.role;
    data['Satker'] = this.satker;
    data['SubSatker'] = this.subSatker;
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