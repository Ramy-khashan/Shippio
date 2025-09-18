import 'package:flutter/material.dart';

class LoadingItem extends StatelessWidget {
  const LoadingItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(child: const CircularProgressIndicator());
  }
}