import 'package:flutter/material.dart';

class TransactionHistoryModel {
  final IconData icon;
  final String title;
  final String date;
  final int amount;
  final String balance;
  final String? brand;
  final String? descriptionTitle;
  final String? description;

  TransactionHistoryModel({
    required this.icon,
    required this.title,
    required this.date,
    required this.amount,
    required this.balance,
    this.brand,
    this.descriptionTitle,
    this.description,
  });

  static List<TransactionHistoryModel> get mockTransactions => [
        TransactionHistoryModel(
          icon: Icons.label_outline,
          title: 'Kampanya',
          date: 'Bugün 12:15',
          amount: 500,
          balance: '50.430',
          brand: 'Secil Store',
        ),
        TransactionHistoryModel(
          icon: Icons.error_outline,
          title: 'Görev Silindi',
          date: '16 Nisan 2025 12:32',
          amount: -500,
          balance: '50.700',
          descriptionTitle: 'Yıl Sonu Görevi',
          description: 'İçerik Oluşturma',
        ),
        TransactionHistoryModel(
          icon: Icons.card_giftcard_outlined,
          title: 'Hediye',
          date: '16 Nisan 2025 12:32',
          amount: 1000,
          balance: '50.700',
          brand: 'Secil Store',
        ),
        TransactionHistoryModel(
          icon: Icons.shopping_bag_outlined,
          title: 'Alışveriş',
          date: '21 Nisan 2025 10:40',
          amount: -600,
          balance: '49.780',
        ),
      ];
}
