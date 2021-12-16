import 'package:firebase_authentication/core/utils/app_colors.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(
            Icons.menu,
            color: AppColors.black,
          ),
          onPressed: () {},
        ),
        backgroundColor: AppColors.deepOrange50,
        title: const Text(
          'Home',
          style: TextStyle(
            color: AppColors.black,
          ),
        ),
        actions: [
          IconButton(
            icon: const Icon(
              Icons.search,
              color: AppColors.black,
            ),
            onPressed: () {},
          ),
          IconButton(
            icon: const Icon(
              Icons.share,
              color: AppColors.black,
            ),
            onPressed: () {},
          ),
        ],
      ),
      body: Container(),
    );
  }
}
