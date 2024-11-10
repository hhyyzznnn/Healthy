  import 'package:flutter/material.dart';
import 'package:healthy/presentation/screens/diet.dart';
import 'package:healthy/presentation/screens/home.dart';
import 'package:healthy/presentation/screens/profile.dart';
import 'package:healthy/presentation/screens/work_out.dart';
  import 'constants/colors.dart';

  void main() async {
    runApp(MaterialApp(home: MainPage()));
  }

  class NavItem {
    final IconData activeIcon;
    final String label;

    const NavItem({
      required this.activeIcon,
      required this.label
  });
  }

  const _navItems = [
    NavItem(activeIcon: Icons.home, label: "홈"),
    NavItem(activeIcon: Icons.restaurant, label: "식단"),
    NavItem(activeIcon: Icons.fitness_center, label: "운동"),
    NavItem(activeIcon: Icons.person, label: "프로필")
  ];

  class MainPage extends StatefulWidget {
    const MainPage({super.key});

    @override
    State<MainPage> createState() => _MainPageState();
  }

  class _MainPageState extends State<MainPage> with TickerProviderStateMixin {
    int _index = 0;
    late TabController _tabController;

    @override
    void initState() {
      super.initState();
      _tabController = TabController(length: _navItems.length, vsync: this);
      _tabController.addListener(tabListener);
    }

    @override
    void dispose() {
      _tabController.removeListener(tabListener);

      super.dispose();
    }

    void tabListener() {
      setState(() {
        _index = _tabController.index;
      });
    }

    @override
    Widget build(BuildContext context) {
      return Scaffold(
        bottomNavigationBar: BottomNavigationBar(
          onTap: (int index) {
            _tabController.animateTo(index);
          },
          currentIndex: _index,
          items: _navItems.map((item) {
            return BottomNavigationBarItem(icon: Icon(item.activeIcon), label: item.label);
          }).toList(),
          selectedItemColor: AppColors.primaryBlue,
          unselectedItemColor: Colors.grey,
          selectedFontSize: 15,
          unselectedFontSize: 15,
          type: BottomNavigationBarType.fixed,
        ),
        body: TabBarView(
          physics: const NeverScrollableScrollPhysics(),
          controller: _tabController,
          children: const [
            HomeScreen(),
            WorkoutScreen(),
            DietScreen(),
            ProfileScreen()
          ],
        )
      );
    }
  }
