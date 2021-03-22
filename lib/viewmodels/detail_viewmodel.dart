import 'package:flutter/material.dart';
import 'package:gregory/models/resturant_detail.dart';
import 'package:gregory/networking/api_client.dart';
import 'package:gregory/networking/api_response.dart';

class DetailViewmodel with ChangeNotifier {
  int _optionSelected = 0;
  get optionSelected => this._optionSelected;
  set optionSelected(val) {
    _optionSelected = val;

    notifyListeners();
  }

  int _currentPage = 0;
  get currentPage => this._currentPage;
  set currentPage(val) {
    _currentPage = val;

    notifyListeners();
  }

  DetailViewmodel() {
    fetchResturant();
  }

  // ApiResponse<List<ResturantListModel>> _allResuturants;
  ApiResponse<ResturantDetail> _resturant;

  get allResuturant => this._resturant;

  // set allResuturants(ApiResponse<List<ResturantListModel>> response) {
  set allResuturant(ApiResponse<ResturantDetail> response) {
    _resturant = response;
    notifyListeners();
  }

  fetchResturant() async {
    _resturant = ApiResponse.loading("Loading");
    try {
      final response = await ApiClient()
          .get("https://us-central1-grigora-alt.cloudfunctions.net/details");
      ResturantDetail _resturant = resturantDetailFromJson(response);
      // List<ResturantListModel> _allResuturants = resturantListModelFromJson(response);
      allResuturant = ApiResponse.completed(_resturant);
    } catch (e) {
      print(e.toString());
      allResuturant = ApiResponse.error(e.toString());
    }
  }
}
