import 'dart:async';

import 'package:adhicine/screens/report_page.dart';
import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import '../utils/AppColors.dart';
import '../widgets/ShowDialogs.dart';
import 'AddMedicinesPage.dart';
import 'home_page.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentIndex = 0;
  late StreamSubscription<ConnectivityResult> _subscription;
  bool _isConnected = true;
  // List of icons for bottom navigation
  final List<IconData> iconList = [
    Icons.home_rounded,
    Icons.signal_cellular_alt_rounded,
  ];
  @override
  void initState() {
    super.initState();
    _checkConnectivity();
  }

  // List of pages corresponding to each tab
  final List<Widget> pages = [
    const HomePage(),
    const ProfilePage(),
  ];

  // Function to check initial internet status
  Future<void> _checkConnectivity() async {
    var result = await Connectivity().checkConnectivity();
    _updateConnectionStatus(result);

    // Listen for connectivity changes
    _subscription = Connectivity().onConnectivityChanged.listen(_updateConnectionStatus);
  }

  // Update connection status & show message if disconnected
  void _updateConnectionStatus(ConnectivityResult result) {
    bool connected = result != ConnectivityResult.none;

    if (!connected) {
      ShowDialogs.showSnackBar(context, "No internet connection. Please check your network.");

    }

    setState(() {
      _isConnected = connected;
    });
  }

  @override
  void dispose() {
    _subscription.cancel(); // Stop listening to connectivity changes
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: pages[_currentIndex], // Display current page
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).push(
            PageRouteBuilder(
              pageBuilder: (context, animation, secondaryAnimation) => AddMedicinesPage(),
              transitionsBuilder: (context, animation, secondaryAnimation, child) {
                const begin = Offset(0.0, 1.0); // Starts from bottom
                const end = Offset.zero;
                const curve = Curves.easeInOut;

                var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
                var offsetAnimation = animation.drive(tween);

                return SlideTransition(
                  position: offsetAnimation,
                  child: child,
                );
              },
            ),
          );
        },
        shape: CircleBorder(),
        child: Icon(Icons.add,color: AppColors.backgroundColor,),
        backgroundColor: AppColors.black, // Customize the color
      ),

      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: AnimatedBottomNavigationBar(
 elevation: 10,
        borderColor: Colors.grey.shade50,
        icons: iconList,
        iconSize: 40,
        activeIndex: _currentIndex,
        gapLocation: GapLocation.center,
        notchSmoothness: NotchSmoothness.verySmoothEdge,
        backgroundColor: AppColors.backgroundColor,
        activeColor: Colors.indigo.shade400,
        inactiveColor: AppColors.inactiveIconColor,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
      ),
    );
  }
}
