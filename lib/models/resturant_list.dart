// To parse this JSON data, do
//
//     final resturantListModel = resturantListModelFromJson(jsonString);

import 'dart:convert';

ResturantListModel resturantListModelFromJson(String str) =>
    ResturantListModel.fromJson(json.decode(str));

class ResturantListModel {
  ResturantListModel({
    this.cuisines,
    this.promos,
    this.restaurants,
  });

  List<Cuisine> cuisines;
  List<Promo> promos;
  List<Restaurant> restaurants;

  factory ResturantListModel.fromJson(Map<String, dynamic> json) =>
      ResturantListModel(
        cuisines: List<Cuisine>.from(
            json["cuisines"].map((x) => Cuisine.fromJson(x))),
        promos: List<Promo>.from(json["promos"].map((x) => Promo.fromJson(x))),
        restaurants: List<Restaurant>.from(
            json["restaurants"].map((x) => Restaurant.fromJson(x))),
      );
}

class Cuisine {
  Cuisine({
    this.id,
    this.name,
    this.frenchName,
    this.description,
    this.frenchDescription,
    this.image,
    this.icon,
    this.backgroundIcon,
    this.status,
    this.createdAt,
    this.updatedAt,
    this.selected,
  });

  int id;
  String name;
  String frenchName;
  String description;
  String frenchDescription;
  String image;
  String icon;
  String backgroundIcon;
  String status;
  DateTime createdAt;
  DateTime updatedAt;
  bool selected;

  factory Cuisine.fromJson(Map<String, dynamic> json) => Cuisine(
        id: json["id"],
        name: json["name"],
        frenchName: json["french_name"],
        description: json["description"],
        frenchDescription: json["french_description"],
        image: json["image"],
        icon: json["icon"],
        backgroundIcon: json["background_icon"],
        status: json["status"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        selected: json["selected"],
      );
}

class Promo {
  Promo({
    this.id,
    this.name,
    this.image,
    this.frenchName,
    this.description,
    this.frenchDescription,
    this.code,
  });

  int id;
  String name;
  String image;
  String frenchName;
  String description;
  String frenchDescription;
  String code;

  factory Promo.fromJson(Map<String, dynamic> json) => Promo(
        id: json["id"],
        name: json["name"],
        image: json["image"],
        frenchName: json["french_name"],
        description: json["description"],
        frenchDescription: json["french_description"],
        code: json["code"],
      );
}

class Restaurant {
  Restaurant({
    this.id,
    this.name,
    this.frenchName,
    this.image,
    this.address,
    this.frenchAddress,
    this.pickup,
    this.preparingTime,
    this.tableBooking,
    this.busyStatus,
    this.noOfSeats,
    this.averageRating,
    this.totalRating,
    this.latitude,
    this.longitude,
    this.status,
  });

  int id;
  String name;
  String frenchName;
  String image;
  String address;
  String frenchAddress;
  String pickup;
  int preparingTime;
  String tableBooking;
  bool busyStatus;
  int noOfSeats;
  int averageRating;
  int totalRating;
  String latitude;
  String longitude;
  String status;

  factory Restaurant.fromJson(Map<String, dynamic> json) => Restaurant(
        id: json["id"],
        name: json["name"],
        frenchName: json["french_name"],
        image: json["image"],
        address: json["address"],
        frenchAddress: json["french_address"],
        pickup: json["pickup"],
        preparingTime: json["preparing_time"],
        tableBooking: json["table_booking"],
        busyStatus: json["busy_status"],
        noOfSeats: json["no_of_seats"] == null ? null : json["no_of_seats"],
        averageRating: json["average_rating"],
        totalRating: json["total_rating"],
        latitude: json["latitude"] == null ? null : json["latitude"],
        longitude: json["longitude"] == null ? null : json["longitude"],
        status: json["status"] == null ? null : json["status"],
      );
}
