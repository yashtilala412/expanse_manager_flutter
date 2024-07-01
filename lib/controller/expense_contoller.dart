import 'package:expense_manager/model/expense_data.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:intl/intl.dart';

class ExpenseController extends GetxController {
  String selected = "All";
  int curBottomNavIndex = 0;

  List<List<dynamic>> iconList = [
    [Icons.home, "Home"],
    [Icons.swap_horiz, "Transfer"],
    [Icons.account_balance_wallet_outlined, "Wallet"],
    [Icons.account_circle_outlined, "Profile"],
  ];

  double income = 0;
  double spent = 0;

  late List<ExpenseData> expenses;

  String category = "Food";
  String paymentType = "Cash";

  TextEditingController amountCntrl = TextEditingController();

  final box = GetStorage();
  double amount = 0.0;
}
