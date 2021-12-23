// To parse this JSON data, do
//
//     final loginResponse = loginResponseFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

LoginResponse loginResponseFromJson(String str) =>
    LoginResponse.fromJson(json.decode(str));

String loginResponseToJson(LoginResponse data) => json.encode(data.toJson());

class LoginResponse {
  LoginResponse({
    this.response,
    required this.message,
    required this.success,
  });

  Response? response;
  String message;
  bool success;

  factory LoginResponse.fromJson(Map<String, dynamic> json) => LoginResponse(
        response: Response.fromJson(json["response"]),
        message: json["message"],
        success: json["success"],
      );

  Map<String, dynamic> toJson() => {
        "response": response!.toJson(),
        "message": message,
        "success": success,
      };
}

class Response {
  Response({
    this.token,
    this.user,
  });

  String? token;
  User? user;

  factory Response.fromJson(Map<String, dynamic> json) => Response(
        token: json["token"],
        user: User.fromJson(json["user"]),
      );

  Map<String, dynamic> toJson() => {
        "token": token,
        "user": user!.toJson(),
      };
}

class User {
  User({
    required this.id,
    required this.password,
    required this.lastLogin,
    required this.isSuperuser,
    required this.username,
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.isStaff,
    required this.isActive,
    required this.dateJoined,
    required this.isCelebrity,
    required this.category,
    required this.deliveryDuration,
    required this.price,
    required this.currencyCode,
    required this.deliveryDurationUnit,
    required this.image,
    required this.intro,
    required this.bio,
    required this.paypalEmail,
    required this.isFeatured,
    required this.reviews,
    required this.fans,
    required this.groups,
    required this.userPermissions,
  });

  int id;
  String password;
  DateTime lastLogin;
  bool isSuperuser;
  String username;
  String firstName;
  String lastName;
  String email;
  bool isStaff;
  bool isActive;
  DateTime dateJoined;
  bool isCelebrity;
  String category;
  int deliveryDuration;
  double price;
  String currencyCode;
  String deliveryDurationUnit;
  String image;
  String intro;
  String bio;
  String paypalEmail;
  bool isFeatured;
  String reviews;
  String fans;
  List<dynamic> groups;
  List<dynamic> userPermissions;

  factory User.fromJson(Map<String, dynamic> json) => User(
        id: json["id"],
        password: json["password"],
        lastLogin: DateTime.parse(json["last_login"]),
        isSuperuser: json["is_superuser"],
        username: json["username"],
        firstName: json["first_name"],
        lastName: json["last_name"],
        email: json["email"],
        isStaff: json["is_staff"],
        isActive: json["is_active"],
        dateJoined: DateTime.parse(json["date_joined"]),
        isCelebrity: json["is_celebrity"],
        category: json["category"],
        deliveryDuration: json["delivery_duration"],
        price: json["price"],
        currencyCode: json["currency_code"],
        deliveryDurationUnit: json["delivery_duration_unit"],
        image: json["image"],
        intro: json["intro"],
        bio: json["bio"],
        paypalEmail: json["paypal_email"],
        isFeatured: json["is_featured"],
        reviews: json["reviews"],
        fans: json["fans"],
        groups: List<dynamic>.from(json["groups"].map((x) => x)),
        userPermissions:
            List<dynamic>.from(json["user_permissions"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "password": password,
        "last_login": lastLogin.toIso8601String(),
        "is_superuser": isSuperuser,
        "username": username,
        "first_name": firstName,
        "last_name": lastName,
        "email": email,
        "is_staff": isStaff,
        "is_active": isActive,
        "date_joined": dateJoined.toIso8601String(),
        "is_celebrity": isCelebrity,
        "category": category,
        "delivery_duration": deliveryDuration,
        "price": price,
        "currency_code": currencyCode,
        "delivery_duration_unit": deliveryDurationUnit,
        "image": image,
        "intro": intro,
        "bio": bio,
        "paypal_email": paypalEmail,
        "is_featured": isFeatured,
        "reviews": reviews,
        "fans": fans,
        "groups": List<dynamic>.from(groups.map((x) => x)),
        "user_permissions": List<dynamic>.from(userPermissions.map((x) => x)),
      };
}
