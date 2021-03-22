import 'package:flutter/material.dart';
import 'package:gregory/models/resturant_list.dart';
import 'package:gregory/networking/api_client.dart';
import 'package:gregory/networking/api_response.dart';

class HomeViewmodel with ChangeNotifier {
  int _currentImage = 0;
  get currentImage => this._currentImage;
  set currentImage(val) {
    _currentImage = val;

    notifyListeners();
  }

  int _currentPage = 0;
  get currentPage => this._currentPage;
  set currentPage(val) {
    _currentPage = val;

    notifyListeners();
  }

  HomeViewmodel() {
    fetchResturants();
  }

  // ApiResponse<List<ResturantListModel>> _allResuturants;
  ApiResponse<ResturantListModel> _allResuturants;

  get allResuturants => this._allResuturants;

  // set allResuturants(ApiResponse<List<ResturantListModel>> response) {
  set allResuturants(ApiResponse<ResturantListModel> response) {
    _allResuturants = response;
    notifyListeners();
  }

  fetchResturants() async {
    _allResuturants = ApiResponse.loading("Loading");
    try {
      final response = await ApiClient()
          .get("https://us-central1-grigora-alt.cloudfunctions.net/home");
      ResturantListModel _allResuturants = resturantListModelFromJson(response);
      // List<ResturantListModel> _allResuturants = resturantListModelFromJson(response);
      allResuturants = ApiResponse.completed(_allResuturants);
    } catch (e) {
      print(e.toString());
      allResuturants = ApiResponse.error(e.toString());
    }
  }
}
