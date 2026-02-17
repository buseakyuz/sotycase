import 'package:flutter/material.dart';
import 'package:sotycase/product/constants/soty_colors.dart';
import '../../wallet/view/wallet_view.dart';

class BaseView extends StatefulWidget {
  const BaseView({super.key});

  @override
  State<BaseView> createState() => _BaseViewState();
}

class _BaseViewState extends State<BaseView> {
  int _currentIndex = 2; // Default to Wallet

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
      body: IndexedStack(
        index: _currentIndex,
        children: _screens,
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: _currentIndex,
        onTap: (index) => setState(() => _currentIndex = index),
        selectedItemColor: SotyColors.primary,
        unselectedItemColor: Colors.grey,
        selectedLabelStyle: const TextStyle(fontWeight: FontWeight.bold, fontSize: 10),
        unselectedLabelStyle: const TextStyle(fontWeight: FontWeight.bold, fontSize: 10),
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.flash_on_outlined), label: 'Akış'),
          BottomNavigationBarItem(icon: Icon(Icons.assignment_outlined), label: 'Görev'),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_balance_wallet),
            label: 'Cüzdan',
          ),
          BottomNavigationBarItem(icon: Icon(Icons.local_offer_outlined), label: 'Kampanya'),
          BottomNavigationBarItem(icon: Icon(Icons.person_outline), label: 'Profil'),
        ],
      ),
    );
  }
}
