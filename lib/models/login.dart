import 'dart:convert';

Login loginFromJson(String str) => Login.fromJson(json.decode(str));

class Login {
  String? status;
  User? user;
  Authorisation? authorisation;
  ApiKey? apiKey;

  Login({this.status, this.user, this.authorisation, this.apiKey});

  Login.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    user = json['user'] != null ? User.fromJson(json['user']) : null;
    authorisation = json['authorisation'] != null
        ? Authorisation.fromJson(json['authorisation'])
        : null;
    apiKey = json['api-key'] != null ? ApiKey.fromJson(json['api-key']) : null;
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
    if (apiKey != null) {
      data['api-key'] = apiKey!.toJson();
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
        ? Subsatker.fromJson(json['subsatker'])
        : null;
    satker = json['satker'] != null ? Satker.fromJson(json['satker']) : null;
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
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['satker'] = satker;
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
    final Map<String, dynamic> data = <String, dynamic>{};
    data['token'] = token;
    data['type'] = type;
    return data;
  }
}

class ApiKey {
  String? apiKey;
  String? expirationDate;

  ApiKey({this.apiKey, this.expirationDate});

  ApiKey.fromJson(Map<String, dynamic> json) {
    apiKey = json['api_key'];
    expirationDate = json['expiration_date'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['api_key'] = apiKey;
    data['expiration_date'] = expirationDate;
    return data;
  }
}
