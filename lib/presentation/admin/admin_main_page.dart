import 'package:canary_farm/core/constants/constants.dart';
import 'package:canary_farm/presentation/admin/home/admin_home_screen.dart';
import 'package:canary_farm/presentation/admin/profile/pages/admin_profile_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:canary_farm/presentation/admin/home/bloc/admin_stats_bloc.dart';

class AdminMainPage extends StatefulWidget {
  const AdminMainPage({super.key});

  @override
  State<AdminMainPage> createState() => _AdminMainPageState();
}

class _AdminMainPageState extends State<AdminMainPage> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    final _widgets = [
      // Bungkus dengan BlocProvider jika tidak global
      BlocProvider.value(
        value: BlocProvider.of<AdminStatsBloc>(context),
        child: const AdminHomeScreen(),
      ),
      const AdminProfileScreen(),
    ];

    return Scaffold(
      body: IndexedStack(index: _selectedIndex, children: _widgets),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.vertical(top: Radius.circular(16.0)),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: 10.0,
              blurStyle: BlurStyle.outer,
              offset: const Offset(0, -8),
              spreadRadius: 0,
            ),
          ],
        ),
        child: Theme(
          data: ThemeData(
            splashColor: Colors.transparent,
            highlightColor: Colors.transparent,
          ),
          child: BottomNavigationBar(
            backgroundColor: AppColors.primary,
            useLegacyColorScheme: false,
            currentIndex: _selectedIndex,
            onTap: (value) => setState(() {
              _selectedIndex = value;
            }),
            type: BottomNavigationBarType.fixed,
            selectedLabelStyle: const TextStyle(color: AppColors.lightSheet),
            selectedIconTheme: const IconThemeData(color: AppColors.lightSheet),
            elevation: 0,
            items: const [
              BottomNavigationBarItem(
                icon: Icon(Icons.home),
                label: 'Home',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.person),
                label: 'Profile',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
