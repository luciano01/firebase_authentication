import 'package:firebase_authentication/authentication/presentation/mobx/home/home_store.dart';
import 'package:firebase_authentication/core/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final HomeStore store = Modular.get<HomeStore>();

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
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          if (store.authenticationStore.user!.photoURL == null)
            const FlutterLogo(size: 100)
          else
            Image.network(
              store.authenticationStore.user!.photoURL!,
              width: 100,
            ),
          const SizedBox(height: 16),
          Text(store.authenticationStore.user?.uid ?? 'No Token'),
          Text(store.authenticationStore.user?.email ?? 'No Email'),
          const SizedBox(height: 16),
          Center(
            child: ElevatedButton.icon(
              icon: const Icon(Icons.logout),
              label: const Text('Sign-out'),
              style: ElevatedButton.styleFrom(
                primary: AppColors.deepOrange300,
              ),
              onPressed: () {
                store.signOut();
                store.disconnect();
              },
            ),
          ),
        ],
      ),
    );
  }
}
