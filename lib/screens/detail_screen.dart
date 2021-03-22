import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:gregory/custom_widgets/arrow_btn.dart';
import 'package:gregory/custom_widgets/border_container.dart';
import 'package:gregory/custom_widgets/detail_container.dart';
import 'package:gregory/custom_widgets/nav_items.dart';
import 'package:gregory/custom_widgets/white_text.dart';
import 'package:gregory/custom_widgets/yellow_white_text.dart';
import 'package:gregory/models/resturant_detail.dart';
import 'package:gregory/networking/api_response.dart';
import 'package:gregory/screens/nav_appbar_template.dart';
import 'package:gregory/screens/response_screens.dart';

import 'package:gregory/screens/show_detail_screen.dart';

import 'package:gregory/utils/app_colors.dart';
import 'package:gregory/utils/spacing.dart';
import 'package:gregory/utils/style.dart';
import 'package:gregory/viewmodels/detail_viewmodel.dart';

import 'package:provider/provider.dart';

class DetailScreen extends StatelessWidget {
  final String resturantName;
  final String resturantImage;

  const DetailScreen({Key key, this.resturantName, this.resturantImage})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    final _model = Provider.of<DetailViewmodel>(context);

    final ResturantDetail _resturant = _model.allResuturant.data;
    PageController _controller = PageController();
    Item _popResturant = _model.allResuturant.status == Status.COMPLETED
        ? _model.allResuturant.data.popularItems[1]
        : Item();

    return NavBarTemplate(
      childWidget: _model.allResuturant.status == Status.LOADING
          ? Loading(
              loadingMessage: "Loading",
            )
          : _model.allResuturant.status == Status.ERROR
              ? Error(
                  errorMessage: _model.allResuturant.message,
                  onRetryPressed: () {
                    _model.fetchResturant();
                  },
                )
              : ListView(
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height * 0.8,
                      child: Stack(
                        children: [
                          Image.network(
                            _resturant.restaurantProfileImage,
                            fit: BoxFit.fill,
                            height: MediaQuery.of(context).size.height * 0.7,
                          ),
                          Container(
                            padding: EdgeInsets.symmetric(horizontal: 10.0),
                            width: MediaQuery.of(context).size.width,
                            color: Color(0xff020711).withOpacity(0.8),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                CircleAvatar(
                                    radius: 100,
                                    backgroundImage:
                                        NetworkImage(resturantImage)),
                                WhiteText(
                                  text: resturantName,
                                  fontSize: 25,
                                  fontWeight: FontWeight.bold,
                                ),
                                WhiteText(
                                  text: _resturant.cuisines,
                                  fontSize: 18,
                                  textAlign: TextAlign.center,
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Icon(
                                      Icons.star_border_outlined,
                                      color: Colors.white,
                                    ),
                                    WhiteText(
                                      text: _resturant.totalRating.toString() +
                                          " (" +
                                          _resturant.totalReview.toString() +
                                          " Reviews)",
                                      fontSize: 16,
                                    ),
                                    kSizedBoxW5,
                                    Container(
                                      height: 8,
                                      width: 8,
                                      decoration: BoxDecoration(
                                          color: Colors.white,
                                          shape: BoxShape.circle),
                                    ),
                                    kSizedBoxW5,
                                    WhiteText(
                                      text: "0.87 KM Away",
                                      fontSize: 16,
                                    ),
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      "OPEN",
                                      style: TextStyle(
                                          color: Colors.green,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    kSizedBoxW5,
                                    Container(
                                      height: 8,
                                      width: 8,
                                      decoration: BoxDecoration(
                                          color: Colors.white,
                                          shape: BoxShape.circle),
                                    ),
                                    kSizedBoxW5,
                                    GestureDetector(
                                      child: Row(
                                        children: [
                                          Icon(
                                            Icons.info_outline_rounded,
                                            color: Colors.white,
                                          ),
                                          kSizedBoxW5,
                                          WhiteText(text: "MORE INFO")
                                        ],
                                      ),
                                      onTap: () {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) =>
                                                ShowDetailScreen(
                                              address: _resturant.address,
                                              name: _resturant.restaurantName,
                                              openingTime:
                                                  _resturant.openingTime,
                                              closingTime:
                                                  _resturant.closingTime,
                                              rating: _resturant.totalRating
                                                  .toString(),
                                            ),
                                          ),
                                        );
                                      },
                                    )
                                  ],
                                ),
                                Divider(
                                  color: Colors.white,
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    YellowWhiteColumn(
                                      heading: "Min Order",
                                      value: "N200",
                                    ),
                                    kSizedBoxW10,
                                    YellowWhiteColumn(
                                      heading: "Prep. TIme",
                                      value: _resturant.estimatedPreparingTime
                                              .toString() +
                                          " mins",
                                    ),
                                    kSizedBoxW10,
                                    YellowWhiteColumn(
                                      heading: "Delivery Fee",
                                      value: "From N 250",
                                    ),
                                  ],
                                ),
                                Container(
                                  height: 40,
                                  child: ListView(
                                    scrollDirection: Axis.horizontal,
                                    children: [
                                      BorderContainer(
                                        bgColor: Colors.white,
                                        child: Row(
                                          mainAxisSize: MainAxisSize.min,
                                          children: [
                                            kSizedBoxW10,
                                            Text(
                                              "Delivery",
                                              textAlign: TextAlign.center,
                                              style: TextStyle(
                                                  // color: kSecondaryColor,
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                            Container(
                                              width: 45,
                                            ),
                                            Icon(
                                              Icons
                                                  .keyboard_arrow_down_outlined,
                                            )
                                          ],
                                        ),
                                      ),
                                      kSizedBoxW5,
                                      BorderContainer(
                                        child: Row(
                                          mainAxisSize: MainAxisSize.min,
                                          children: [
                                            Icon(
                                              Icons.person_search_outlined,
                                              color: Colors.white,
                                            ),
                                            WhiteText(
                                              text: "Start Group Order",
                                              fontSize: 16,
                                            ),
                                          ],
                                        ),
                                      ),
                                      kSizedBoxW5,
                                      BorderContainer(
                                        child: WhiteText(
                                          text: "Book a table",
                                          fontSize: 16,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Column(
                                  children: [
                                    Text(
                                      "Choose a Menu",
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          color: kSecondaryColor, fontSize: 12),
                                    ),
                                    BorderContainer(
                                      color: kSecondaryColor,
                                      child: Row(
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          kSizedBoxW10,
                                          Text(
                                            "Lunch",
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                                color: kSecondaryColor,
                                                fontSize: 16,
                                                fontWeight: FontWeight.bold),
                                          ),
                                          Container(
                                            width: 50,
                                          ),
                                          Icon(
                                            Icons.keyboard_arrow_down_outlined,
                                            color: kSecondaryColor,
                                          )
                                        ],
                                      ),
                                    ),
                                  ],
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(15.0).copyWith(bottom: 0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Fries & Grills",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: kPrimaryColor),
                          ),
                          Container(
                            margin: EdgeInsets.only(top: 8.0),
                            color: kPrimaryColor,
                            height: 4.0,
                            width: 25,
                          ),
                          kSizedBoxH10,
                          Row(
                            children: [
                              Text("Featured ",
                                  style: kBoldHeading.copyWith(
                                      color: kSecondaryColor)),
                              Text(
                                "Items",
                                style: kBoldHeading,
                              )
                            ],
                          ),
                          Text(
                            "Vendors featured items",
                            style: TextStyle(color: Colors.grey, fontSize: 12),
                          ),
                          kSizedBoxH10,
                        ],
                      ),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          // margin: EdgeInsets.symmetric(horizontal: 20),
                          height: 150,
                          child: Stack(
                            children: [
                              Center(
                                child: PageView.builder(
                                  pageSnapping: false,
                                  controller: _controller,
                                  onPageChanged: (val) {
                                    _model.currentPage = val;
                                  },
                                  itemCount: _model
                                      .allResuturant.data.featuredItems.length,
                                  // _model.allResuturants.data.restaurants.length,
                                  itemBuilder: (ctx, index) {
                                    Item _resturant = _model.allResuturant.data
                                        .featuredItems[index];
                                    return Container(
                                      margin: const EdgeInsets.symmetric(
                                          horizontal: 15.0),
                                      child: DetailContainer(
                                        desc: _resturant.description,
                                        imageAsset: _resturant.image,
                                        name: _resturant.name,
                                        rating:
                                            _resturant.avgRatings.toString(),
                                        price: _resturant.price,
                                      ),
                                    );
                                  },
                                ),

                                // PageContainer(controller: _controller, model: _model),
                              ),
                              // _controller.page != 0
                              _model.currentPage != 0
                                  ? Align(
                                      alignment: Alignment.centerLeft,
                                      child: ArrowButton(
                                        isBack: true,
                                        onTap: () {
                                          _controller.previousPage(
                                              duration:
                                                  Duration(milliseconds: 300),
                                              curve: Curves.linear);
                                        },
                                      ),
                                    )
                                  : Container(),
                              _model.currentPage != 3
                                  ? Align(
                                      alignment: Alignment.centerRight,
                                      child: ArrowButton(
                                        onTap: () {
                                          _controller.nextPage(
                                              duration:
                                                  Duration(milliseconds: 300),
                                              curve: Curves.linear);
                                        },
                                      ),
                                    )
                                  : Container(),
                            ],
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Fries & Grills",
                            style: kBoldHeading,
                          ),
                          Text(
                            "Fries & Grills",
                            style: TextStyle(color: Colors.grey),
                          ),
                          kSizedBoxH10,
                          DetailContainer(
                            desc: _popResturant.description,
                            imageAsset: _popResturant.image,
                            name: _popResturant.name,
                            rating: _popResturant.avgRatings.toString(),
                            price: _popResturant.price,
                          ),
                        ],
                      ),
                    )
                  ],
                ),
    );
  }
}
