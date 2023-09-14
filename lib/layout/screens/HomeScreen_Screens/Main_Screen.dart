import 'package:e_commerce/widgets/Home_Item.dart';
import 'package:flutter/material.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: homeItem(),
    );
  }
}
