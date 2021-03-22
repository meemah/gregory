import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:gregory/custom_widgets/nav_items.dart';
import 'package:gregory/utils/app_colors.dart';
import 'package:gregory/utils/spacing.dart';

class NavBarTemplate extends StatelessWidget {
  final Widget childWidget;

  const NavBarTemplate({Key key, this.childWidget}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      endDrawer: Drawer(
          child: Padding(
        padding: const EdgeInsets.all(pagePadding),
        child: ListView(
          children: [
            Align(
              alignment: Alignment.topRight,
              child: IconButton(
                icon: Icon(Icons.close),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
            ),
            NavItem(
              icon: CupertinoIcons.person,
              iconColor: kSecondaryColor,
              title: "Sign In / Sign Up",
            ),
            Divider(
              thickness: 1.0,
            ),
            NavItem(
              icon: CupertinoIcons.home,
              iconColor: kPrimaryColor,
              title: "Home",
            ),
            NavItem(
              icon: CupertinoIcons.info_circle,
              title: "About Grigora",
            ),
            NavItem(
              icon: CupertinoIcons.question_circle,
              title: "Help & Support",
            ),
            NavItem(
              icon: CupertinoIcons.bag,
              title: "Partner with us",
            ),
            Divider(
              thickness: 1.0,
            ),
            SecondaryNavItem(
              title: "+234 901 066 9160",
              icon: CupertinoIcons.phone,
            ),
            SecondaryNavItem(
              title: "hello@grigora.com",
              icon: Icons.mail_outline,
            )
          ],
        ),
      )),
      appBar: AppBar(
        leading: Padding(
          padding: const EdgeInsets.only(left: 10.0),
          child: SvgPicture.asset(
            "asset/icon.svg",
            color: kPrimaryColor,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        title: Row(
          children: [
            Spacer(),
            Icon(CupertinoIcons.location),
            Text("Maitama, Abuja",
                style: GoogleFonts.muli(
                    color: Colors.black,
                    fontSize: 16,
                    fontWeight: FontWeight.bold)),
            Icon(
              CupertinoIcons.chevron_down,
              color: Colors.grey,
            ),
            Spacer(),
            Icon(Icons.notifications_none_outlined),
          ],
        ),
      ),
      body: SafeArea(child: childWidget),
    );
  }
}
