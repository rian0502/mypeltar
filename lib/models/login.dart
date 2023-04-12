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
  List<String>? role;
  Subsatker? subsatker;
  Satker? satker;

  User(
      {this.nama,
        this.email,
        this.username,
        this.role,
        this.subsatker,
        this.satker});

  User.fromJson(Map<String, dynamic> json) {
    nama = json['nama'];
    email = json['email'];
    username = json['username'];
    role = json['role'].cast<String>();
    subsatker = json['subsatker'] != null
        ? new Subsatker.fromJson(json['subsatker'])
        : null;
    satker =
    json['satker'] != null ? new Satker.fromJson(json['satker']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['nama'] = this.nama;
    data['email'] = this.email;
    data['username'] = this.username;
    data['role'] = this.role;
    if (this.subsatker != null) {
      data['subsatker'] = this.subsatker!.toJson();
    }
    if (this.satker != null) {
      data['satker'] = this.satker!.toJson();
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
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['subsatker'] = this.subsatker;
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
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['satker'] = this.satker;
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