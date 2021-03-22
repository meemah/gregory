import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gregory/custom_widgets/arrow_btn.dart';
import 'package:gregory/custom_widgets/border_container.dart';
import 'package:gregory/custom_widgets/resturant_container.dart';
import 'package:gregory/custom_widgets/white_text.dart';
import 'package:gregory/models/resturant_list.dart';
import 'package:gregory/networking/api_response.dart';
import 'package:gregory/screens/detail_screen.dart';
import 'package:gregory/screens/nav_appbar_template.dart';
import 'package:gregory/screens/response_screens.dart';
import 'package:gregory/utils/app_colors.dart';
import 'package:gregory/utils/spacing.dart';
import 'package:gregory/utils/style.dart';
import 'package:gregory/viewmodels/home_viewmodel.dart';
import 'package:provider/provider.dart';
import 'package:shimmer/shimmer.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';

class HomeScreen extends StatelessWidget {
  PageController _controller = PageController();

  final ItemScrollController itemScrollController = ItemScrollController();
  final ItemPositionsListener itemPositionsListener =
      ItemPositionsListener.create();

  List _colorList = [
    0xffF9F9EC,
    0xffEBF9EC,
    0xffECF7F9,
    0xffEEECF9,
    0xffF9EBF3,
    0xffF9F2EC,
    0xffECF9EC,
    0xffF9EBF1,
    0xffF6F9EC,
    0xffEBF9F7,
    0xffF2EBF9,
    0xffF9EDEB,
    0xffEBF9EE,
    0xffECEDF9
  ];
  List _childWidgets = [
    Row(
      children: [
        SelectionText(
          text: "Above 3",
        ),
        Icon(
          Icons.star,
          size: 14,
        ),
        Icon(
          Icons.keyboard_arrow_down,
          size: 14,
        )
      ],
    ),
    Row(
      children: [
        SelectionText(text: "##"),
        Icon(
          Icons.keyboard_arrow_down,
          size: 14,
        )
      ],
    ),
    SelectionText(
      text: "Currently Open",
    ),
    SelectionText(
      text: "Pick Up",
    ),
    SelectionText(
      text: "Trending",
    ),
    SelectionText(
      text: "Vegeterian",
    ),
  ];
  @override
  Widget build(BuildContext context) {
    final _model = Provider.of<HomeViewmodel>(context);

    return NavBarTemplate(
      childWidget: _model.allResuturants.status == Status.LOADING
          ? Loading(
              loadingMessage: "Loading",
            )
          : _model.allResuturants.status == Status.ERROR
              ? Error(
                  errorMessage: _model.allResuturants.message,
                  onRetryPressed: () {
                    _model.fetchResturants();
                  },
                )
              : SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        padding: EdgeInsets.all(20.0).copyWith(left: 10.0),
                        width: double.infinity,
                        color: Colors.black.withOpacity(0.7),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Align(
                              alignment: Alignment.center,
                              child: WhiteText(
                                text: "ONGOING PROMOTION",
                                textAlign: TextAlign.center,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            kSizedBoxH10,
                            kSizedBoxH10,
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Image.asset(
                                  "asset/promo.png",
                                  scale: 2.0,
                                ),
                                ArrowButton(
                                  onTap: () {},
                                )
                              ],
                            ),
                          ],
                        ),
                      ),
                      kSizedBoxH10,
                      Container(
                        margin: EdgeInsets.all(25.0),
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey[300]),
                        ),
                        child: TextFormField(
                          decoration: InputDecoration(
                              // helperText: "hello",
                              suffixIcon: Icon(CupertinoIcons.search),
                              contentPadding: EdgeInsets.all(15.0),
                              isDense: true,
                              // isCollapsed: true,
                              hintStyle: TextStyle(fontSize: 14),
                              hintText: "Search for vendors and cuisines",
                              border: InputBorder.none),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Stack(
                          children: [
                            Container(
                              margin: EdgeInsets.symmetric(horizontal: 20.0),
                              height: 90,
                              child: ScrollablePositionedList.builder(
                                scrollDirection: Axis.horizontal,
                                itemCount:
                                    _model.allResuturants.data.cuisines.length,
                                itemBuilder: (context, index) {
                                  Cuisine _cuisine = _model
                                      .allResuturants.data.cuisines[index];
                                  return Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Container(
                                        margin: EdgeInsets.only(right: 10),
                                        padding: EdgeInsets.all(10),
                                        height: 70,
                                        width: 70,
                                        decoration: BoxDecoration(
                                            shape: BoxShape.circle,
                                            color: Color(_colorList[index])),
                                        child: Image.network(
                                          _cuisine.icon,
                                          height: 50,
                                          width: 50,
                                          fit: BoxFit.contain,
                                        ),
                                      ),
                                      kSizedBoxH5,
                                      Align(
                                        alignment: Alignment.center,
                                        child: Text(
                                          _cuisine.name,
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                              fontSize: 10,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      )
                                    ],
                                  );
                                },
                                itemScrollController: itemScrollController,
                                itemPositionsListener: itemPositionsListener,
                              ),
                            ),
                            _model.currentImage != 0
                                ? Positioned(
                                    top: 25,
                                    child: ArrowButton(
                                      isBack: true,
                                      onTap: () {
                                        if (_model.currentImage > 0)
                                          itemScrollController.jumpTo(
                                              index: _model.currentImage--);
                                      },
                                    ),
                                  )
                                : Container(),
                            _model.currentImage !=
                                    _model.allResuturants.data.cuisines.length
                                ? Positioned(
                                    top: 25,
                                    right: 0,
                                    child: ArrowButton(
                                      onTap: () {
                                        itemScrollController.jumpTo(
                                            index: _model.currentImage++);
                                      },
                                    ),
                                  )
                                : Container(),
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.all(pagePadding),
                        child: Container(
                          height: 30,
                          child: ListView.builder(
                            itemCount: _childWidgets.length,
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (ctx, index) {
                              return Container(
                                margin: EdgeInsets.only(right: 10.0),
                                child: BorderContainer(
                                  bgColor: index > 1
                                      ? Colors.grey.shade300
                                      : Colors.white,
                                  // padding: 10.0,
                                  color: index > 1
                                      ? Colors.grey.shade300
                                      : Colors.black26,
                                  child: _childWidgets[index],
                                ),
                              );
                            },
                          ),
                        ),
                      ),
                      Padding(
                        padding:
                            const EdgeInsets.symmetric(horizontal: pagePadding),
                        child: Column(
                          children: [
                            Row(
                              children: [
                                Text(
                                  "New ",
                                  style: kBoldHeading.copyWith(
                                      color: kSecondaryColor),
                                ),
                                Text(
                                  "In Grigoria",
                                  style: kBoldHeading,
                                )
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "Recently added vendors",
                                  style: TextStyle(
                                      color: Colors.grey, fontSize: 12),
                                ),
                                Spacer(),
                                Text(
                                  "View All",
                                  style: TextStyle(
                                      color: kPrimaryColor,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 12),
                                ),
                                Icon(
                                  CupertinoIcons.arrow_right,
                                  color: kPrimaryColor,
                                  size: 14,
                                )
                              ],
                            ),
                          ],
                        ),
                      ),
                      kSizedBoxH10,
                      Container(
                        // margin: EdgeInsets.symmetric(horizontal: 20.0),
                        padding: EdgeInsets.symmetric(horizontal: 10.0),
                        height: 100,
                        child: Stack(
                          children: [
                            Center(
                              child: PageContainer(
                                  controller: _controller, model: _model),
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
                      kSizedBoxH20,
                      Padding(
                        padding:
                            const EdgeInsets.symmetric(horizontal: pagePadding),
                        child: Column(
                          children: [
                            Row(
                              children: [
                                Text("Resturants ", style: kBoldHeading),
                                Text("Near ",
                                    style: kBoldHeading.copyWith(
                                        color: kSecondaryColor)),
                                Text("You", style: kBoldHeading),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "Enjoy delicious meals from resturants and \nvendors around you",
                                  style: TextStyle(
                                      color: Colors.grey, fontSize: 12),
                                ),
                                Spacer(),
                                Text(
                                  "View All",
                                  style: TextStyle(
                                      color: kPrimaryColor,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 12),
                                ),
                                Icon(
                                  CupertinoIcons.arrow_right,
                                  color: kPrimaryColor,
                                  size: 14,
                                )
                              ],
                            ),
                            kSizedBoxH10,
                            ListView.builder(
                              shrinkWrap: true,
                              itemCount:
                                  _model.allResuturants.data.restaurants.length,
                              itemBuilder: (ctx, index) {
                                Restaurant _resturant = _model
                                    .allResuturants.data.restaurants[index];
                                return Container(
                                  margin: EdgeInsets.only(bottom: 10),
                                  child: ResturantContainer(
                                    imageAsset: _resturant.image,
                                    time: _resturant.preparingTime,
                                    rating: _resturant.averageRating,
                                    name: _resturant.name,
                                  ),
                                );
                              },
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
    );
  }
}

class SelectionText extends StatelessWidget {
  final String text;
  const SelectionText({
    Key key,
    this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(fontSize: 11),
    );
  }
}

class PageContainer extends StatelessWidget {
  const PageContainer({
    Key key,
    @required PageController controller,
    @required HomeViewmodel model,
  })  : _controller = controller,
        _model = model,
        super(key: key);

  final PageController _controller;
  final HomeViewmodel _model;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 10.0),
      // width: MediaQuery.of(context).size.width - 30,
      child: PageView.builder(
        pageSnapping: false,
        controller: _controller,
        onPageChanged: (val) {
          _model.currentPage = val;
        },
        itemCount: _model.allResuturants.data.restaurants.length,
        itemBuilder: (ctx, index) {
          Restaurant _resturant = _model.allResuturants.data.restaurants[index];
          return ResturantContainer(
            imageAsset: _resturant.image,
            time: _resturant.preparingTime,
            rating: _resturant.averageRating,
            name: _resturant.name,
          );
        },
      ),
    );
  }
}
