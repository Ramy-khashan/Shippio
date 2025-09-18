import 'package:flutter/material.dart';
import 'widget/packages_item.dart';
import 'widget/welcome_part.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [const WelcomePart(), const PackagesItem()],
        ),
      ),
    );
  }
}
