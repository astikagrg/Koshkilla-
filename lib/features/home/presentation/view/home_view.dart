import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'bottom_view/batch_view.dart';
import 'bottom_view/course_view.dart';
import 'bottom_view/dashboard_view.dart';
import 'bottom_view/profile_view.dart';

class HomeView extends ConsumerStatefulWidget {
  const HomeView({super.key});

  @override
  ConsumerState<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends ConsumerState<HomeView> {

    final int _selectedindex = 1;
  String choice = 'All';
  int _selectedIndex = 0;
  List<Widget> lstBottomScreen = [
    const HomeView(),
    // const AddTransactionView(),
    // const AllTransactionsView(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
    
      bottomNavigationBar: CurvedNavigationBar(
        color: Colors.purple.shade200,
        animationDuration: const Duration(milliseconds: 80),
        backgroundColor: Colors.transparent,
        animationCurve: Curves.easeInOut, // Smoother animation curve

        onTap: (index) {
          setState(() {
            _selectedIndex = index;
            // getSelectedWidget(index, context);
          });
        },
        items: const [
          Icon(
            Icons.home,
          ),
          Icon(Icons.add),
          Icon(Icons.show_chart),
        ],
      ),
      body: lstBottomScreen[_selectedIndex],
    );
  }
}

