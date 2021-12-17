import 'package:firebase_authentication/authentication/presentation/pages/login/login_page.dart';
import 'package:firebase_authentication/authentication/presentation/pages/signup/signup_page.dart';
import 'package:firebase_authentication/authentication/presentation/widgets/home/image_widget.dart';
import 'package:firebase_authentication/authentication/presentation/widgets/home/infor_widget.dart';
import 'package:firebase_authentication/core/utils/app_colors.dart';
import 'package:flutter/material.dart';

class AuthenticationPage extends StatefulWidget {
  const AuthenticationPage({Key? key}) : super(key: key);

  @override
  AauthenticationStatePage createState() => AauthenticationStatePage();
}

class AauthenticationStatePage extends State<AuthenticationPage>
    with SingleTickerProviderStateMixin {
  late TabController _controller;

  @override
  void initState() {
    _controller = TabController(length: 2, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.deepOrange50,
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(
          parent: AlwaysScrollableScrollPhysics(),
        ),
        child: Column(
          children: [
            Stack(
              children: [
                InforWidget(
                  onPressed: () {},
                ),
                const ImageWidget(),
              ],
            ),
            TabBar(
              controller: _controller,
              labelColor: AppColors.deepOrange300,
              labelStyle: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
              unselectedLabelColor: AppColors.grey600,
              unselectedLabelStyle: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.normal,
              ),
              indicatorSize: TabBarIndicatorSize.label,
              indicatorColor: AppColors.deepOrange300,
              indicatorWeight: 3,
              tabs: const [
                Tab(text: 'Log-in'),
                Tab(text: 'Sign-up'),
              ],
            ),
            Container(
              decoration: const BoxDecoration(
                color: AppColors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(4),
                  topRight: Radius.circular(4),
                ),
              ),
              child: SizedBox(
                height: MediaQuery.of(context).size.height,
                child: TabBarView(
                  physics: const NeverScrollableScrollPhysics(),
                  controller: _controller,
                  children: const [
                    LoginPage(),
                    SignupPage(),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
