import 'package:firebase_authentication/authentication/presentation/mobx/launch/launch_store.dart';
import 'package:firebase_authentication/authentication/presentation/widgets/launch/image_widget.dart';
import 'package:firebase_authentication/authentication/presentation/widgets/launch/title_widget.dart';
import 'package:firebase_authentication/core/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';

class LaunchPage extends StatefulWidget {
  const LaunchPage({Key? key}) : super(key: key);

  @override
  _LaunchPageState createState() => _LaunchPageState();
}

class _LaunchPageState extends State<LaunchPage> {
  final LaunchStore store = Modular.get<LaunchStore>();
  late ReactionDisposer disposer;

  @override
  void initState() {
    /* disposer = autorun((_) {
      store.checkIfUserIsLogged();
    }); */
    Future.delayed(const Duration(seconds: 2)).then((_) {
      Modular.to.pushReplacementNamed('/login');
    });
    super.initState();
  }

  /* @override
  void dispose() {
    disposer();
    super.dispose();
  } */

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        color: AppColors.deepOrange50,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            ImageWidget(),
            TitleWidget(),
          ],
        ),
      ),
    );
  }
}
