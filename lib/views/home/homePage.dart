import 'package:buy_sell_app/views/home/tabs/blockDeals.dart';
import 'package:buy_sell_app/views/home/tabs/bulkDeals.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      body: DefaultTabController(
        length: 2,
        child: SafeArea(
          child: SizedBox(
            height: screenHeight * 1,
            width: screenWidth,
            child: Column(
              children: [
                TabBar(tabs: [
                  Tab(
                    child: Text(
                      "Bulk Deal",
                      style: TextStyle(color: Colors.black),
                    ),
                  ),
                  Tab(
                    child: Text(
                      'Block Deals',
                      style: TextStyle(color: Colors.black),
                    ),
                  )
                ]),
                Expanded(
                  child: TabBarView(children: [BulkDealTab(), BlockDealTab()]),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
