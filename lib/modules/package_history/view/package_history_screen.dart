import 'package:flutter/material.dart';
import '../../../core/constant/app_colors.dart';
import 'widgets/package_history_shape.dart';

class PackageHistoryScreen extends StatelessWidget {
  const PackageHistoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
          surfaceTintColor: Theme.of(context).scaffoldBackgroundColor,
          title: Text("Packages"),
          
          centerTitle: true,
          bottom: TabBar(
            indicatorSize: TabBarIndicatorSize.tab,
            unselectedLabelColor: AppColors.greyColor,
            labelColor: AppColors.whiteColor,
            indicatorColor: AppColors.whiteColor,

            tabs: [
              Tab(text: "All"),
              Tab(text: "New"),
              Tab(text: "Past"),
              Tab(text: "Drafts"),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            ListView.builder(
              shrinkWrap: true,
              itemCount: 100,
              itemBuilder: (context, index) => PackageHistoryShape(),
            ),  ListView.builder(
              shrinkWrap: true,
              itemCount: 100,
              itemBuilder: (context, index) => PackageHistoryShape(),
            ),  ListView.builder(
              shrinkWrap: true,
              itemCount: 100,
              itemBuilder: (context, index) => PackageHistoryShape(),
            ),  ListView.builder(
              shrinkWrap: true,
              itemCount: 100,
              itemBuilder: (context, index) => PackageHistoryShape(),
            ),
           
          ],
        ),
      ),
    );
  }
}
