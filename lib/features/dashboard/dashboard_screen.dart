import 'package:car_rental_app/common/design_system/design_system.dart';
import 'package:car_rental_app/features/dashboard/features/hires_page/presentation/pages/hires_page.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:url_launcher/url_launcher.dart';

import 'features/home_page/presentation/pages/home_page.dart';

final avatarURL = 'https://avatars.githubusercontent.com/u/17296142?v=4';
final funnyURL = 'https://www.upwork.com/freelancers/~015d507ab30c2b0955';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({Key? key}) : super(key: key);

  @override
  _DashboardScreenState createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  final _homePageKey = GlobalKey();
  final _hiresPageKey = GlobalKey();
  int _selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: DSColors.BACKGROUND,
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: true,
        elevation: 1,
        leadingWidth: 110,
        title: Text(
          'Home',
          style: DSTextStyles.poppins.copyWith(
            color: DSColors.GREY_700,
            fontWeight: FontWeight.w600,
            fontSize: 18.relative,
          ),
        ),
        actions: [
          Icon(
            Icons.notifications_none_outlined,
            color: DSColors.GREY_500,
          ),
          SizedBox(
            width: 16.relative,
          ),
          CupertinoButton(
            padding: EdgeInsets.zero,
            onPressed: () async {
              if (await canLaunch(funnyURL)) launch(funnyURL);
            },
            child: CircleAvatar(
              backgroundImage: NetworkImage(avatarURL),
            ),
          ),
          SizedBox(
            width: 24.relative,
          ),
        ],
        leading: Center(
          child: Padding(
            padding: EdgeInsets.only(left: 24.relative),
            child: Container(
              child: DSIcons.brandLogo,
              height: 23,
            ),
          ),
        ),
      ),
      bottomNavigationBar: _bottomBar(),
      body: _selectedIndex == 0
          ? HomePage(
              key: _homePageKey,
            )
          : HiresPage(
              key: _hiresPageKey,
            ),
    );
  }

  Widget _bottomBar() => Container(
        height: 64.relative + MediaQuery.of(context).padding.bottom,
        color: Colors.white,
        child: Row(
          children: [
            CupertinoButton(
                padding: EdgeInsets.zero,
                child: Column(
                  children: [
                    Container(
                      width: 80.relative,
                      height: 2,
                      color: _selectedIndex == 0
                          ? DSColors.GREEN_600
                          : Colors.transparent,
                    ),
                    SizedBox(
                      height: 10.relative,
                    ),
                    DSIcons.homeIcon(
                      _selectedIndex == 0
                          ? DSColors.GREEN_600
                          : DSColors.GREY_500,
                    ),
                    Text(
                      'Home',
                      style: DSTextStyles.poppins.copyWith(
                        color: _selectedIndex == 0
                            ? DSColors.GREEN_600
                            : DSColors.GREY_500,
                        fontSize: 12.relative,
                        fontWeight: _selectedIndex == 0
                            ? FontWeight.w600
                            : FontWeight.w400,
                      ),
                    )
                  ],
                ),
                onPressed: () {
                  setState(() {
                    _selectedIndex = 0;
                  });
                }),
            CupertinoButton(
                padding: EdgeInsets.zero,
                child: Column(
                  children: [
                    Container(
                      width: 80.relative,
                      height: 2,
                      color: _selectedIndex == 1
                          ? DSColors.GREEN_600
                          : Colors.transparent,
                    ),
                    SizedBox(
                      height: 10.relative,
                    ),
                    DSIcons.hiresIcon(
                      _selectedIndex == 1
                          ? DSColors.GREEN_600
                          : DSColors.GREY_500,
                    ),
                    Text(
                      'Hires',
                      style: DSTextStyles.poppins.copyWith(
                        color: _selectedIndex == 1
                            ? DSColors.GREEN_600
                            : DSColors.GREY_500,
                        fontSize: 12.relative,
                        fontWeight: _selectedIndex == 1
                            ? FontWeight.w600
                            : FontWeight.w400,
                      ),
                    )
                  ],
                ),
                onPressed: () {
                  setState(() {
                    _selectedIndex = 1;
                  });
                }),
          ],
          mainAxisAlignment: MainAxisAlignment.spaceAround,
        ),
      );
}
