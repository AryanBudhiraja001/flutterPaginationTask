class LoginModel {
  String? code;
  String? message;
  Data? data;

  LoginModel({this.code, this.message, this.data});

  LoginModel.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    message = json['message'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['code'] = this.code;
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Data {
  String? id;
  String? email;
  String? totalSteps;
  String? totalKm;
  String? totalKcal;
  String? longestDistance;
  String? longestDuration;
  String? oki;
  String? boost;
  String? rank;
  Null? expiry;
  Null? token;

  Data(
      {this.id,
        this.email,
        this.totalSteps,
        this.totalKm,
        this.totalKcal,
        this.longestDistance,
        this.longestDuration,
        this.oki,
        this.boost,
        this.rank,
        this.expiry,
        this.token});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    email = json['email'];
    totalSteps = json['total_steps'];
    totalKm = json['total_km'];
    totalKcal = json['total_kcal'];
    longestDistance = json['longest_distance'];
    longestDuration = json['longest_duration'];
    oki = json['oki'];
    boost = json['boost'];
    rank = json['rank'];
    expiry = json['expiry'];
    token = json['token'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['email'] = this.email;
    data['total_steps'] = this.totalSteps;
    data['total_km'] = this.totalKm;
    data['total_kcal'] = this.totalKcal;
    data['longest_distance'] = this.longestDistance;
    data['longest_duration'] = this.longestDuration;
    data['oki'] = this.oki;
    data['boost'] = this.boost;
    data['rank'] = this.rank;
    data['expiry'] = this.expiry;
    data['token'] = this.token;
    return data;
  }
}