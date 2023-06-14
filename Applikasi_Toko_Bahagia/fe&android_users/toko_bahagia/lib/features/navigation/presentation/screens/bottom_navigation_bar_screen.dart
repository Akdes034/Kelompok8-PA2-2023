import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import '../../../../routes/app_routers.gr.dart';
import '../../../../shared/theme.dart';

class NavigationBarScreen extends StatefulWidget {
  const NavigationBarScreen({super.key});

  @override
  State<NavigationBarScreen> createState() => _NavigationBarScreenState();
}

class _NavigationBarScreenState extends State<NavigationBarScreen> {
  int _selectedIndex = 0;
  @override
  void initState() {
    super.initState();
    // check route name and set index
    if (AutoRouter.of(context).current.name == 'HomeScreen') {
      _selectedIndex = 0;
    } else if (AutoRouter.of(context).current.name == 'PulsaScreen') {
      _selectedIndex = 1;
    } else if (AutoRouter.of(context).current.name == 'RoomScreen') {
      _selectedIndex = 2;
    } else if (AutoRouter.of(context).current.name == 'ProfileScreen') {
      _selectedIndex = 3;
    }
  }

  void _onItemTapped(int index) {
    // check if index is same with current index
    if (_selectedIndex == index) {
      return;
    } else {
      setState(() {
        if (index == 0) {
          AutoRouter.of(context).pushAndPopUntil(
            const HomeScreen(),
            predicate: (_) => false,
          );
        } else if (index == 1) {
          AutoRouter.of(context).pushAndPopUntil(
            const CreditScreen(),
            predicate: (_) => false,
          );
        } else if (index == 2) {
          AutoRouter.of(context).push(
            const CartScreen(),
          );
        } else if (index == 3) {
          AutoRouter.of(context).pushAndPopUntil(
            const ProfileScreen(),
            predicate: (_) => false,
          );
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: _selectedIndex,
      items: const [
        BottomNavigationBarItem(
          icon: Icon(Icons.fastfood),
          label: 'Produk',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.phone_android),
          label: 'Pulsa',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.shopping_cart),
          label: 'Keranjang',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.person),
          label: 'Profil',
        ),
      ],
      onTap: (index) {
        _onItemTapped(index);
      },
      selectedItemColor: chocolate,
      unselectedItemColor: Colors.grey,
      showUnselectedLabels: true,
      type: BottomNavigationBarType.fixed,
    );
  }
}
