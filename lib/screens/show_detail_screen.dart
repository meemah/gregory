import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:gregory/utils/app_colors.dart';
import 'package:gregory/utils/spacing.dart';
import 'package:gregory/utils/style.dart';

class ShowDetailScreen extends StatelessWidget {
  final String name;
  final String address;
  final String openingTime;
  final String closingTime;
  final String rating;

  const ShowDetailScreen(
      {Key key,
      this.name,
      this.address,
      this.openingTime,
      this.closingTime,
      this.rating})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Align(
                  alignment: Alignment.topRight,
                  child: GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Icon(Icons.close))),
              Text(
                name,
                style: kBoldHeading,
              ),
              InfoContainer(
                icon: CupertinoIcons.location,
                title: "Address",
                val: address,
              ),
              InfoContainer(
                icon: CupertinoIcons.time,
                title: "Opening Time",
                val: openingTime,
              ),
              InfoContainer(
                icon: CupertinoIcons.time,
                title: "Closing Time",
                val: closingTime,
              ),
              InfoContainer(
                icon: CupertinoIcons.star,
                title: "Average Rating",
                val: rating + "Stars",
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class InfoContainer extends StatelessWidget {
  final IconData icon;
  final String title;
  final String val;

  const InfoContainer({Key key, this.icon, this.title, this.val})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 20.0, left: 10),
      child: Row(
        children: [
          Icon(
            icon,
            color: kSecondaryColor,
          ),
          kSizedBoxW20,
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                ),
                Text(val)
              ],
            ),
          ),
        ],
      ),
    );
  }
}
