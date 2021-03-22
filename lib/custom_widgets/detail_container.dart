import 'package:flutter/material.dart';
import 'package:gregory/utils/app_colors.dart';
import 'package:gregory/utils/spacing.dart';

class DetailContainer extends StatelessWidget {
  final String imageAsset;
  final String desc;
  final String name;
  final String rating;
  final String price;

  const DetailContainer({
    Key key,
    this.imageAsset,
    this.name,
    this.rating,
    this.desc,
    this.price,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10.0),
      // width: MediaQuery.of(context).size.width * 0.7,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey.shade200),
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: Row(
        children: [
          Image.network(
            imageAsset,
            height: 120,
            width: 120,
            fit: BoxFit.fill,
          ),
          kSizedBoxW10,
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                Text(
                  desc,
                  style: TextStyle(fontSize: 12, color: Colors.grey),
                ),
                kSizedBoxH10,
                Row(
                  children: [
                    Container(
                      padding: EdgeInsets.all(3.0),
                      child: Row(
                        children: [
                          Icon(
                            Icons.star_rate,
                            color: Colors.white,
                            size: 16,
                          ),
                          kSizedBoxW5,
                          Text(
                            rating.toString(),
                            style: TextStyle(fontSize: 12, color: Colors.white),
                          ),
                        ],
                      ),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8.0),
                          color: double.parse(rating) > 0
                              ? Colors.green
                              : Colors.grey),
                    ),
                    kSizedBoxW5,
                    Container(
                      width: 10,
                      height: 10,
                      decoration: BoxDecoration(
                          shape: BoxShape.circle, color: kSecondaryColor),
                    ),
                    kSizedBoxW5,
                    Text("N" + price)
                  ],
                )
              ],
            ),
          )
        ],
      ),
      // child: Center(child: Text(index.toString())),
    );
  }
}
