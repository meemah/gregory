// To parse this JSON data, do
//
//     final resturantDetail = resturantDetailFromJson(jsonString);

import 'dart:convert';

ResturantDetail resturantDetailFromJson(String str) =>
    ResturantDetail.fromJson(json.decode(str));

class ResturantDetail {
  ResturantDetail({
    this.deliveryFee,
    this.restaurantId,
    this.restaurantName,
    this.restaurantProfileImage,
    this.restaurantImage,
    this.cuisines,
    this.totalRating,
    this.totalReview,
    this.veg,
    this.pickup,
    this.tableBooking,
    this.noOfSeats,
    this.fullTime,
    this.openingTime,
    this.latitude,
    this.longitude,
    this.address,
    this.frenchAddress,
    this.closingTime,
    this.estimatedPreparingTime,
    this.busyStatus,
    this.popularItems,
    this.featuredItems,
    this.allData,
    this.totalCartItem,
  });

  int deliveryFee;
  int restaurantId;
  String restaurantName;
  String restaurantProfileImage;
  String restaurantImage;
  String cuisines;
  int totalRating;
  int totalReview;
  String veg;
  String pickup;
  String tableBooking;
  int noOfSeats;
  String fullTime;
  String openingTime;
  String latitude;
  String longitude;
  String address;
  String frenchAddress;
  String closingTime;
  String estimatedPreparingTime;
  bool busyStatus;
  List<Item> popularItems;
  List<Item> featuredItems;
  List<AllDatum> allData;
  int totalCartItem;

  factory ResturantDetail.fromJson(Map<String, dynamic> json) =>
      ResturantDetail(
        deliveryFee: json["delivery_fee"],
        restaurantId: json["restaurant_id"],
        restaurantName: json["restaurant_name"],
        restaurantProfileImage: json["restaurant_profile_image"],
        restaurantImage: json["restaurant_image"],
        cuisines: json["cuisines"],
        totalRating: json["total_rating"],
        totalReview: json["total_review"],
        veg: json["veg"],
        pickup: json["pickup"],
        tableBooking: json["table_booking"],
        noOfSeats: json["no_of_seats"],
        fullTime: json["full_time"],
        openingTime: json["opening_time"],
        latitude: json["latitude"],
        longitude: json["longitude"],
        address: json["address"],
        frenchAddress: json["french_address"],
        closingTime: json["closing_time"],
        estimatedPreparingTime: json["estimated_preparing_time"],
        busyStatus: json["busy_status"],
        popularItems:
            List<Item>.from(json["popular_items"].map((x) => Item.fromJson(x))),
        featuredItems: List<Item>.from(
            json["featured_items"].map((x) => Item.fromJson(x))),
        allData: List<AllDatum>.from(
            json["all_data"].map((x) => AllDatum.fromJson(x))),
        totalCartItem: json["total_cart_item"],
      );
}

class AllDatum {
  AllDatum({
    this.categoryName,
    this.startDate,
    this.endDate,
    this.startTime,
    this.endTime,
    this.specialDay,
    this.data,
  });

  String categoryName;
  dynamic startDate;
  dynamic endDate;
  String startTime;
  String endTime;
  dynamic specialDay;
  List<Datum> data;

  factory AllDatum.fromJson(Map<String, dynamic> json) => AllDatum(
        categoryName: json["category_name"],
        startDate: json["start_date"],
        endDate: json["end_date"],
        startTime: json["start_time"],
        endTime: json["end_time"],
        specialDay: json["special_day"],
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
      );
}

class Datum {
  Datum({
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
    this.itemsCount,
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
  int itemsCount;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
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
        itemsCount: json["items_count"],
      );
}

class Item {
  Item({
    this.id,
    this.restaurantId,
    this.parentCuisineId,
    this.cuisineId,
    this.name,
    this.frenchName,
    this.description,
    this.frenchDescription,
    this.image,
    this.price,
    this.offerPrice,
    this.approxPrepTime,
    this.inOffer,
    this.pureVeg,
    this.approved,
    this.featured,
    this.status,
    this.createdAt,
    this.updatedAt,
    this.cuisineName,
    this.itemRemoveables,
    this.restaurantName,
    this.itemCategories,
    this.avgRatings,
    this.totalRating,
  });

  int id;
  int restaurantId;
  int parentCuisineId;
  int cuisineId;
  String name;
  String frenchName;
  String description;
  String frenchDescription;
  String image;
  String price;
  int offerPrice;
  String approxPrepTime;
  String inOffer;
  String pureVeg;
  String approved;
  String featured;
  String status;
  DateTime createdAt;
  DateTime updatedAt;
  String cuisineName;
  List<ItemRemoveable> itemRemoveables;
  String restaurantName;
  List<ItemCategory> itemCategories;
  dynamic avgRatings;
  dynamic totalRating;

  factory Item.fromJson(Map<String, dynamic> json) => Item(
        id: json["id"],
        restaurantId: json["restaurant_id"],
        parentCuisineId: json["parent_cuisine_id"],
        cuisineId: json["cuisine_id"],
        name: json["name"],
        frenchName: json["french_name"],
        description: json["description"],
        frenchDescription: json["french_description"],
        image: json["image"],
        price: json["price"],
        offerPrice: json["offer_price"],
        approxPrepTime: json["approx_prep_time"],
        inOffer: json["in_offer"],
        pureVeg: json["pure_veg"],
        approved: json["approved"],
        featured: json["featured"],
        status: json["status"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        cuisineName: json["cuisine_name"],
        itemRemoveables: json["item_removeables"] == null
            ? null
            : List<ItemRemoveable>.from(json["item_removeables"]
                .map((x) => ItemRemoveable.fromJson(x))),
        restaurantName: json["restaurant_name"],
        itemCategories: json["item_categories"] == null
            ? null
            : List<ItemCategory>.from(
                json["item_categories"].map((x) => ItemCategory.fromJson(x))),
        avgRatings: json["avg_ratings"],
        totalRating: json["total_rating"],
      );
}

class ItemCategory {
  ItemCategory({
    this.id,
    this.itemId,
    this.name,
    this.frenchName,
    this.selection,
    this.min,
    this.max,
    this.required,
    this.status,
    this.createdAt,
    this.updatedAt,
    this.itemSubCategory,
    this.itemCatId,
    this.addOnPrice,
    this.itemSubSubCategory,
    this.itemSubCatId,
  });

  int id;
  int itemId;
  String name;
  String frenchName;
  String selection;
  int min;
  int max;
  String required;
  String status;
  DateTime createdAt;
  DateTime updatedAt;
  List<ItemCategory> itemSubCategory;
  int itemCatId;
  String addOnPrice;
  List<ItemCategory> itemSubSubCategory;
  int itemSubCatId;

  factory ItemCategory.fromJson(Map<String, dynamic> json) => ItemCategory(
        id: json["id"],
        itemId: json["item_id"] == null ? null : json["item_id"],
        name: json["name"],
        frenchName: json["french_name"],
        selection: json["selection"] == null ? null : json["selection"],
        min: json["min"],
        max: json["max"],
        required: json["required"],
        status: json["status"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        itemSubCategory: json["item_sub_category"] == null
            ? null
            : List<ItemCategory>.from(
                json["item_sub_category"].map((x) => ItemCategory.fromJson(x))),
        itemCatId: json["item_cat_id"] == null ? null : json["item_cat_id"],
        addOnPrice: json["add_on_price"] == null ? null : json["add_on_price"],
        itemSubSubCategory: json["item_sub_sub_category"] == null
            ? null
            : List<ItemCategory>.from(json["item_sub_sub_category"]
                .map((x) => ItemCategory.fromJson(x))),
        itemSubCatId:
            json["item_sub_cat_id"] == null ? null : json["item_sub_cat_id"],
      );
}

class ItemRemoveable {
  ItemRemoveable({
    this.id,
    this.itemId,
    this.name,
    this.frenchName,
    this.status,
    this.createdAt,
    this.updatedAt,
  });

  int id;
  int itemId;
  String name;
  String frenchName;
  String status;
  DateTime createdAt;
  DateTime updatedAt;

  factory ItemRemoveable.fromJson(Map<String, dynamic> json) => ItemRemoveable(
        id: json["id"],
        itemId: json["item_id"],
        name: json["name"],
        frenchName: json["french_name"],
        status: json["status"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
      );
}
