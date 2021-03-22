import 'package:flutter/material.dart';
import 'package:gregory/utils/spacing.dart';

class SecondaryNavItem extends StatelessWidget {
  final String title;
  final IconData icon;

  const SecondaryNavItem({
    Key key,
    this.title,
    this.icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding:
            const EdgeInsets.all(pagePadding).copyWith(top: 10.0, bottom: 10.0),
        child: Row(
          children: [
            Icon(
              icon,
            ),
            kSizedBoxW20,
            Text(title)
          ],
        ),
      ),
    );
  }
}

class NavItem extends StatelessWidget {
  final String title;
  final IconData icon;
  final Color iconColor;
  const NavItem({
    Key key,
    this.title,
    this.icon,
    this.iconColor = Colors.black,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(pagePadding),
      child: Row(
        children: [
          Icon(
            icon,
            color: iconColor,
            size: 30,
          ),
          kSizedBoxW20,
          Text(
            title,
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          )
        ],
      ),
    );
  }
}
