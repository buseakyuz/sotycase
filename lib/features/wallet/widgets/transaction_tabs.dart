import 'package:flutter/material.dart';
import '../../../../product/constants/soty_colors.dart';

class TransactionTabs extends StatefulWidget {
  final Function(int) onChanged;
  const TransactionTabs({super.key, required this.onChanged});

  @override
  State<TransactionTabs> createState() => _TransactionTabsState();
}

class _TransactionTabsState extends State<TransactionTabs> {
  int _selectedIndex = 0;
  final List<String> _tabs = [
    'Tümü',
    'Bekleyen',
    'Kazandıklarım',
    'Harcadıklarım',
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
      padding: const EdgeInsets.all(6),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(30),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.05),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Row(
        children: List.generate(_tabs.length, (index) {
          final isSelected = _selectedIndex == index;
          return Expanded(
            child: GestureDetector(
              onTap: () {
                setState(() => _selectedIndex = index);
                widget.onChanged(index);
              },
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 250),
                padding: const EdgeInsets.symmetric(vertical: 12),
                decoration: BoxDecoration(
                  color: isSelected ? Colors.white : Colors.transparent,
                  borderRadius: BorderRadius.circular(25),
                  boxShadow: isSelected
                      ? [
                          BoxShadow(
                            color: Colors.black.withValues(alpha: 0.1),
                            blurRadius: 4,
                            offset: const Offset(0, 2),
                          ),
                        ]
                      : [],
                ),
                child: Text(
                  _tabs[index],
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: isSelected ? FontWeight.bold : FontWeight.w600,
                    color: isSelected ? SotyColors.primary : Colors.grey,
                  ),
                ),
              ),
            ),
          );
        }),
      ),
    );
  }
}
