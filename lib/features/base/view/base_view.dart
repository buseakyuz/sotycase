import 'package:flutter/material.dart';
import 'package:sotycase/product/constants/soty_colors.dart';
import '../../wallet/view/wallet_view.dart';

class BaseView extends StatefulWidget {
  const BaseView({super.key});

  @override
  State<BaseView> createState() => _BaseViewState();
}

class _BaseViewState extends State<BaseView> {
  int _currentIndex = 2;

  final List<Widget> _screens = [
    const Scaffold(body: Center(child: Text('Akış'))),
    const Scaffold(body: Center(child: Text('Görev'))),
    const WalletView(),
    const Scaffold(body: Center(child: Text('Kampanya'))),
    const Scaffold(body: Center(child: Text('Profil'))),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true, // Navigation bar arkasının boş kalmaması için
      body: IndexedStack(index: _currentIndex, children: _screens),
      bottomNavigationBar: _buildBottomAppBar(),
      floatingActionButton: _buildMiddleButton(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }

  Widget _buildBottomAppBar() {
    return BottomAppBar(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      height: 70,
      color: Colors.white,
      shape: const CircularNotchedRectangle(),
      notchMargin: 8,
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          _buildNavItem(0, Icons.home_outlined, 'Akış'),

          _buildNavItem(1, Icons.assignment_outlined, 'Görev'),
          SizedBox(width: 40),
          _buildNavItem(3, Icons.explore_outlined, 'Kampanya'),

          _buildNavItem(4, Icons.person_outline, 'Profil'),
        ].map((child) => Expanded(child: child)).toList(),
      ),
    );
  }

  Widget _buildMiddleButton() {
    return Container(
      margin: const EdgeInsets.only(top: 10),
      child: FloatingActionButton(
        onPressed: () => setState(() => _currentIndex = 2),
        backgroundColor: SotyColors.primary,
        elevation: 4,
        shape: const CircleBorder(),
        child: const Icon(
          Icons.account_balance_wallet,
          color: Colors.white,
          size: 30,
        ),
      ),
    );
  }

  Widget _buildNavItem(int index, IconData icon, String label) {
    bool isSelected = _currentIndex == index;
    return InkWell(
      onTap: () => setState(() => _currentIndex = index),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, color: isSelected ? Colors.black : Colors.grey, size: 26),
          const SizedBox(height: 4),
          Text(
            label,
            style: TextStyle(
              fontSize: 11,
              fontWeight: isSelected ? FontWeight.bold : FontWeight.w500,
              color: isSelected ? Colors.black : Colors.grey,
            ),
          ),
        ],
      ),
    );
  }
}
