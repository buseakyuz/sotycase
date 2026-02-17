import 'package:flutter/material.dart';
import 'package:sotycase/product/constants/soty_colors.dart';

class TransactionTabs extends StatefulWidget {
  const TransactionTabs({super.key});

  @override
  State<TransactionTabs> createState() => _TransactionTabsState();
}

class _TransactionTabsState extends State<TransactionTabs> {
  int _selectedIndex = 0;
  final List<String> _tabs = ['Tümü', 'Bekleyen', 'Kazandıklarım', 'Harcadıklarım'];

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      margin: const EdgeInsets.symmetric(vertical: 24),
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: 20),
        itemCount: _tabs.length,
        itemBuilder: (context, index) {
          final isSelected = _selectedIndex == index;
          return Padding(
            padding: const EdgeInsets.only(right: 12),
            child: InkWell(
              onTap: () => setState(() => _selectedIndex = index),
              borderRadius: BorderRadius.circular(20),
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: isSelected ? SotyColors.primary : Colors.white,
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(
                    color: isSelected ? SotyColors.primary : Colors.grey.shade300,
                  ),
                ),
                child: Text(
                  _tabs[index],
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                    color: isSelected ? Colors.white : Colors.grey.shade600,
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
