import 'package:flutter/material.dart';
import 'package:gregory/screens/detail_screen.dart';
import 'package:gregory/utils/app_colors.dart';
import 'package:gregory/utils/spacing.dart';

class ResturantContainer extends StatelessWidget {
  final String imageAsset;
  final String name;
  final int rating;
  final int time;

  const ResturantContainer(
      {Key key, this.imageAsset, this.name, this.rating, this.time})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => DetailScreen(
                    resturantImage: imageAsset,
                    resturantName: name,
                  )),
        );
      },
      child: Container(
        padding: const EdgeInsets.all(10.0),
        // width: MediaQuery.of(context).size.width * 0.7,
        decoration: BoxDecoration(
          color: Colors.grey.shade100,
          borderRadius: BorderRadius.circular(8.0),
        ),
        child: Row(
          children: [
            Image.network(
              imageAsset,
              height: 100,
              width: 120,
              fit: BoxFit.fill,
            ),
            kSizedBoxW10,
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                Text(
                  "0.51 KM Away",
                  style: TextStyle(fontSize: 12),
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
                          color: rating > 0 ? Colors.green : Colors.grey),
                    ),
                    kSizedBoxW5,
                    Container(
                      width: 10,
                      height: 10,
                      decoration: BoxDecoration(
                          shape: BoxShape.circle, color: kSecondaryColor),
                    ),
                    kSizedBoxW5,
                    Text(time.toString() + "mins")
                  ],
                )
              ],
            )
          ],
        ),
        // child: Center(child: Text(index.toString())),
      ),
    );
  }
}
