import 'package:e_commerce/widgets/Default_App_Bar.dart';
import 'package:e_commerce/widgets/Home_Item.dart';
import 'package:flutter/material.dart';

class Favorite extends StatelessWidget {
  const Favorite({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: defaultAppBar(
        title: 'المفضلة',
      ),
      body: homeItem(),
    );
  }
}
