import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:celeb/constant.dart';
import 'package:celeb/ui/screens/explore/explore_screen.dart';
import 'package:flutter/material.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({Key? key}) : super(key: key);

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  var _selectedIndex = 0;
  final _pageController = PageController();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: kScaffoldBackgroundColor,
        body: PageView(
          physics: NeverScrollableScrollPhysics(),
          onPageChanged: (index) => {
            setState(() {
              _selectedIndex = index;
            })
          },
          controller: _pageController,
          children: const [
            ExploreScreen(),
            Center(
              child: Text("Account"),
            ),
            Center(
              child: Text("My Request"),
            ),
            Center(
              child: Text("Settings"),
            ),
          ],
        ),
        bottomNavigationBar: BottomNavyBar(
          backgroundColor: kTextInputFillColor,
          selectedIndex: _selectedIndex,
          showElevation: true, // use this to remove appBar's elevation
          onItemSelected: (index) => setState(() {
            _selectedIndex = index;
            _pageController.animateToPage(_selectedIndex,
                duration: Duration(milliseconds: 300), curve: Curves.easeInOut);
          }),
          items: [
            BottomNavyBarItem(
              icon: const Icon(Icons.apps),
              title: const Text(
                'Explore',
                style: kBottomNavTextStyle,
              ),
              activeColor: kPrimaryColor,
            ),
            BottomNavyBarItem(
                icon: const Icon(Icons.people),
                title: const Text(
                  'My Profile',
                  style: kBottomNavTextStyle,
                ),
                activeColor: kPrimaryColor),
            BottomNavyBarItem(
                icon: const Icon(Icons.credit_card),
                title: const Text(
                  'My Requests',
                  style: kBottomNavTextStyle,
                ),
                activeColor: kPrimaryColor),
            BottomNavyBarItem(
                icon: const Icon(Icons.settings),
                title: const Text(
                  'Settings',
                  style: kBottomNavTextStyle,
                ),
                activeColor: kPrimaryColor),
          ],
        ),
      ),
    );
  }
}
