import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../../../../../core/utils/color_mananger.dart';
import '../../../community_screen/presentation/pages/community_screen.dart';
import '../../../home_screen/presentation/pages/home_screen.dart';
import '../../../profile_screen/presentation/pages/profile_screen.dart';
import '../../../search_screen/presentation/pages/search_screen.dart';

class MainLayoutScreen extends StatefulWidget {
  const MainLayoutScreen({Key? key}) : super(key: key);

  @override
  _MainLayoutScreenState createState() => _MainLayoutScreenState();
}

class _MainLayoutScreenState extends State<MainLayoutScreen> {
  int _selectedIndex = 0;

  final List<Widget> _pages = [
    const HomeScreen(),
    const CommunityScreen(),
    const SearchScreen(),
    ProfileScreen(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        selectedItemColor: ColorManager.secondaryPrimary,
        unselectedItemColor: ColorManager.secondaryPrimary.withOpacity(0.3),
        showSelectedLabels: false,
        showUnselectedLabels: false,
        type: BottomNavigationBarType.fixed,
        items: const [
          BottomNavigationBarItem(
            icon: FaIcon(FontAwesomeIcons.house, size: 20),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: FaIcon(FontAwesomeIcons.envelope, size: 20),
            label: 'Message',
          ),
          BottomNavigationBarItem(
            icon: FaIcon(FontAwesomeIcons.magnifyingGlass, size: 20),
            label: 'Search',
          ),
          BottomNavigationBarItem(
            icon: FaIcon(FontAwesomeIcons.user, size: 20),
            label: 'Profile',
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Icon(Icons.add , color: ColorManager.white,),
        backgroundColor: ColorManager.secondaryPrimary,
        elevation: 0.0,
        shape: const StadiumBorder(),
      ),
    );
  }
}
