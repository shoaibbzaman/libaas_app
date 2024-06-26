import 'package:bottom_bar/bottom_bar.dart';
import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:libaas_app/common_widget/app_color.dart';
import 'package:libaas_app/views/add_item/add_item_screen.dart';
import 'package:libaas_app/views/auth/setting_screen/setting_screen.dart';
import 'package:libaas_app/views/create_outfit/create_outfit_screen.dart';
import 'package:libaas_app/views/home_screen/home_screen.dart';
import 'package:libaas_app/views/notification_screen/notification_screen.dart';

class NavBar extends StatefulWidget {
  final int initialIndex;

  const NavBar({super.key, this.initialIndex = 0});

  @override
  _NavBarState createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> {
  int _currentPage = 0;
  final _pageController = PageController();
  final _pageNo = [
    HomeScreen(),
    const CreateOutfitScreen(),
    AddItemScreen(),
    const NotificationScreen(),
    const SettingScreen()
  ];

  @override
  void initState() {
    super.initState();
    _currentPage = widget.initialIndex;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: _pageNo[_currentPage],
        bottomNavigationBar: ConvexAppBar(
            backgroundColor: ColorConstraint.primaryColor,
            style: TabStyle.fixedCircle,
            items: const [
              TabItem(icon: Icons.home, title: 'Home'),
              TabItem(icon: FontAwesomeIcons.shirt, title: 'Outfit'),
              TabItem(icon: Icons.add, title: 'Add'),
              TabItem(icon: FontAwesomeIcons.solidBell, title: 'Notification'),
              TabItem(icon: Icons.settings, title: 'Setting'),
            ],
            initialActiveIndex: _currentPage,
            onTap: (int i) {
              setState(() => _currentPage = i);
            }));
  }
}
