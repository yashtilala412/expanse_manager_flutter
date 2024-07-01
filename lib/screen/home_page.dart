import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:expense_manager/controller/expense_contoller.dart';
import 'package:expense_manager/screen/add_expense.dart';
import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:get/get.dart';

class HomePage extends StatelessWidget {
  // String selected = "All";
  // int curBottomNavIndex = 0;

  // List<List<dynamic>> iconList = [
  //   [Icons.home, "Home"],
  //   [Icons.swap_horiz, "Transfer"],
  //   [Icons.account_balance_wallet_outlined, "Wallet"],
  //   [Icons.account_circle_outlined, "Profile"],
  // ];

  // double income = 0;
  // double spent = 0;

  // late List expenses;

  // List<ExpenseData> retrieveData() {
  //   final box = GetStorage();
  //   final data = box.read('expenses');
  //   if (data != null && data is List) {
  //     return data.map((item) => ExpenseData.fromMap(item)).toList();
  //   } else {
  //     return [];
  //   }
  // }

  // @override
  // void initState() {
  //   super.initState();
  //   // expenses = retrieveData();
  //   // for (var expense in expenses) {
  //   //   if (expense.category == "Salary") {
  //   //     income += expense.amount;
  //   //   } else {
  //   //     spent += expense.amount;
  //   //   }
  //   // }
  //   // setState(() {});
  // }

  @override
  Widget build(BuildContext context) {
    controller.homeInit();
    return Scaffold(
      body: Container(
        color: const Color(0xFFb6d8ae),
        child: SafeArea(
          child: Container(
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(30),
                topRight: Radius.circular(30),
              ),
            ),
            padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
            child: Column(
              children: [
                Row(
                  children: [
                    const Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Hello,",
                            style: TextStyle(fontSize: 24),
                          ),
                          Text(
                            "Meet",
                            style: TextStyle(
                                fontSize: 24, fontWeight: FontWeight.bold),
                          )
                        ],
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey[300]!),
                          borderRadius: BorderRadius.circular(32)),
                      child: IconButton(
                        onPressed: () {},
                        icon: const Icon(Icons.notifications_none),
                      ),
                    ),
                  ],
                ),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      outlinedButton("All", () {
                        controller.selected = "All";
                        // setState(() {});
                      }),
                      outlinedButton("Daily", () {
                        controller.selected = "Daily";
                        // setState(() {});
                      }),
                      outlinedButton("Weekly", () {
                        controller.selected = "Weekly";
                        // setState(() {});
                      }),
                      outlinedButton("Monthly", () {
                        controller.selected = "Monthly";
                        // setState(() {});
                      }),
                      outlinedButton("Yearly", () {
                        controller.selected = "Yearly";
                        // setState(() {});
                      }),
                    ],
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 20, bottom: 15),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: Colors.grey[100],
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Row(
                            children: [
                              Container(
                                width: 5,
                                height: 15,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(3),
                                  color: const Color(0xFFb6d8ae),
                                ),
                              ),
                              const Text(" Income"),
                            ],
                          ),
                          Row(
                            children: [
                              const SizedBox(width: 10, height: 35),
                              Text(
                                "₹${controller.income % 1 == 0.0 ? controller.income.toInt() : controller.income.toStringAsFixed(2)}",
                                style: const TextStyle(
                                    fontSize: 24, fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                          const SizedBox(height: 20),
                          Row(
                            children: [
                              Container(
                                width: 5,
                                height: 15,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(3),
                                  color: const Color(0xFFfeb9ab),
                                ),
                              ),
                              const Text(" Spent"),
                            ],
                          ),
                          Row(
                            children: [
                              const SizedBox(width: 10, height: 35),
                              Text(
                                "₹${controller.spent % 1 == 0.0 ? controller.spent.toInt() : controller.spent.toStringAsFixed(2)}",
                                style: const TextStyle(
                                    fontSize: 24, fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          // put chart here
                          SizedBox(
                            width: 165,
                            height: 165,
                            child: charts.PieChart(
                              [
                                charts.Series<Expense, int>(
                                  id: 'Expense',
                                  domainFn: (Expense obj, _) => obj.label,
                                  measureFn: (Expense obj, _) => obj.value,
                                  data: [
                                    Expense(0, controller.income.toInt()),
                                    Expense(1, controller.spent.toInt())
                                  ],
                                  colorFn: (datum, index) => [
                                    charts.ColorUtil.fromDartColor(
                                        const Color(0xFFb6d8ae)),
                                    charts.ColorUtil.fromDartColor(
                                        const Color(0xFFfeb9ab)),
                                  ][index!],
                                ),
                              ],
                              animate: false,
                              defaultRenderer: charts.ArcRendererConfig<int>(
                                  arcWidth: 30, startAngle: 31.4),
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
                Row(
                  children: [
                    const Expanded(
                      child: Text(
                        "Recent transactions",
                        style: TextStyle(color: Colors.grey, fontSize: 20),
                      ),
                    ),
                    OutlinedButton(
                      onPressed: () {},
                      style: OutlinedButton.styleFrom(
                        padding: const EdgeInsets.fromLTRB(15, 0, 5, 0),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(32),
                        ),
                        side: BorderSide(color: Colors.grey[300]!, width: 1.5),
                      ),
                      child: const Row(
                        children: [
                          Text(
                            "See All",
                            style: TextStyle(color: Colors.grey),
                          ),
                          Icon(
                            Icons.chevron_right,
                            color: Colors.grey,
                          )
                        ],
                      ),
                    ),
                  ],
                ),
                Expanded(
                  child: ListView.builder(
                    itemCount: controller.expenses.length,
                    itemBuilder: (context, index) {
                      final expense = controller.expenses[index];
                      return expenseCard(
                        expense.amount,
                        expense.category,
                        expense.paymentType,
                        expense.timestamp,
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => AddExpense()));
        },
        backgroundColor: const Color(0xFFb7d9ae),
        child: Icon(
          Icons.add,
          color: Colors.grey[800],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: AnimatedBottomNavigationBar.builder(
        backgroundColor: Colors.white,
        itemCount: 4,
        activeIndex: controller.curBottomNavIndex,
        // onTap: (index) => setState(() => controller.curBottomNavIndex = index),
        onTap: (index) => controller.curBottomNavIndex = index,
        splashSpeedInMilliseconds: 300,
        notchSmoothness: NotchSmoothness.defaultEdge,
        gapLocation: GapLocation.center,
        tabBuilder: (int index, bool isActive) {
          return Column(
            // mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                controller.iconList[index][0],
                size: 24,
                color: isActive ? const Color(0xFFb7d9ae) : Colors.grey[800]!,
              ),
              const SizedBox(height: 4),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: Text(
                  controller.iconList[index][1],
                  style: TextStyle(color: Colors.grey[800]),
                ),
              ),
            ],
          );
        },
      ),
    );
  }

  Widget outlinedButton(String label, VoidCallback onPressed) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0, 0, 10, 0),
      child: OutlinedButton(
        onPressed: onPressed,
        style: OutlinedButton.styleFrom(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          side: BorderSide(
              color: controller.selected == label
                  ? const Color(0xFFb6d8ae)
                  : Colors.grey[300]!,
              width: 1.5),
        ),
        child: Text(
          label,
          style: TextStyle(
              color: controller.selected != label ? Colors.grey : Colors.black),
        ),
      ),
    );
  }

  Widget expenseCard(
      double amount, String category, String paymentType, String timestamp) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0, 0, 0, 15),
      child: Row(
        children: [
          Container(
            width: 48,
            height: 48,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: category == "Food"
                  ? const Color(0xFFfaedd4)
                  : category == "Salary"
                      ? const Color(0xFFe9f3e6)
                      : const Color(0xFFf1e6ff),
            ),
            child: Icon(
              category == "Food"
                  ? Icons.emoji_food_beverage_outlined
                  : category == "Salary"
                      ? Icons.currency_rupee
                      : Icons.local_movies_outlined,
              color: Colors.grey[800],
            ),
          ),
          const SizedBox(width: 15),
          Expanded(
            child: Column(
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        category,
                        style: TextStyle(
                            fontSize: 18,
                            color: Colors.grey[800],
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    Text(
                      "${category == "Salary" ? "" : "-"}₹${amount % 1 == 0.0 ? amount.toInt() : amount.toStringAsFixed(2)}",
                      style: TextStyle(
                          fontSize: 18,
                          color: Colors.grey[800],
                          fontWeight: FontWeight.bold),
                    )
                  ],
                ),
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        paymentType,
                        style: const TextStyle(
                            fontSize: 14,
                            color: Colors.grey,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    Text(
                      timestamp,
                      style: const TextStyle(
                          fontSize: 14,
                          color: Colors.grey,
                          fontWeight: FontWeight.bold),
                    )
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}

class Expense {
  final int label;
  final int value;

  Expense(this.label, this.value);
}
