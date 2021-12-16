import 'package:firebase_authentication/core/utils/app_colors.dart';
import 'package:firebase_authentication/core/utils/app_images.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage>
    with SingleTickerProviderStateMixin {
  late TabController _controller;
  late FocusNode _focusLoginEmail;
  late FocusNode _focusLoginPassword;
  late FocusNode _focusSignUpEmail;
  late FocusNode _focusSignUpPassword;
  late FocusNode _focusSignUpRepeatPassword;

  @override
  void initState() {
    _controller = TabController(length: 2, vsync: this);
    _focusLoginEmail = FocusNode();
    _focusLoginPassword = FocusNode();
    _focusSignUpEmail = FocusNode();
    _focusSignUpPassword = FocusNode();
    _focusSignUpRepeatPassword = FocusNode();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: SingleChildScrollView(
        child: SizedBox(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: Column(
            children: [
              Container(
                color: AppColors.deepOrange50,
                child: Stack(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 25),
                      child: Align(
                        alignment: Alignment.topRight,
                        child: Material(
                          color: Colors.transparent,
                          child: IconButton(
                            icon: const Icon(
                              Icons.info_outline,
                              color: AppColors.black,
                            ),
                            onPressed: () {},
                          ),
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment.center,
                      child: Image.asset(
                        AppImages.image,
                        width: 180,
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                flex: 3,
                child: Column(
                  children: [
                    Container(
                      decoration: const BoxDecoration(
                        color: AppColors.white,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(4),
                          topRight: Radius.circular(4),
                        ),
                      ),
                      child: TabBar(
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
                          Tab(
                            text: 'Log-in',
                          ),
                          Tab(
                            text: 'Sign-up',
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      child: TabBarView(
                        controller: _controller,
                        physics: const NeverScrollableScrollPhysics(),
                        children: [
                          Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(
                                  left: 16,
                                  right: 16,
                                  top: 22,
                                ),
                                child: TextFormField(
                                  focusNode: _focusLoginEmail,
                                  cursorColor: AppColors.deepOrange300,
                                  keyboardType: TextInputType.emailAddress,
                                  decoration: InputDecoration(
                                    prefixIcon: Icon(
                                      Icons.email_outlined,
                                      color: _focusLoginEmail.hasFocus
                                          ? AppColors.deepOrange300
                                          : AppColors.grey600,
                                    ),
                                    label: const Text('Email'),
                                    labelStyle: TextStyle(
                                      color: _focusLoginEmail.hasFocus
                                          ? AppColors.deepOrange300
                                          : AppColors.grey600,
                                    ),
                                    border: const OutlineInputBorder(),
                                    enabledBorder: const OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: AppColors.grey600,
                                      ),
                                    ),
                                    focusedBorder: const OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: AppColors.deepOrange300,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(
                                  left: 16,
                                  right: 16,
                                  top: 16,
                                ),
                                child: TextFormField(
                                  focusNode: _focusLoginPassword,
                                  cursorColor: AppColors.deepOrange300,
                                  obscureText: true,
                                  keyboardType: TextInputType.text,
                                  decoration: InputDecoration(
                                    prefixIcon: Icon(
                                      Icons.password_outlined,
                                      color: _focusLoginPassword.hasFocus
                                          ? AppColors.deepOrange300
                                          : AppColors.grey600,
                                    ),
                                    label: const Text('Password'),
                                    labelStyle: TextStyle(
                                      color: _focusLoginPassword.hasFocus
                                          ? AppColors.deepOrange300
                                          : AppColors.grey600,
                                    ),
                                    border: const OutlineInputBorder(),
                                    enabledBorder: const OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: AppColors.grey600,
                                      ),
                                    ),
                                    focusedBorder: const OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: AppColors.deepOrange300,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              Container(
                                padding: const EdgeInsets.only(
                                  left: 16,
                                  right: 16,
                                  top: 16,
                                ),
                                width: MediaQuery.of(context).size.width,
                                child: ElevatedButton(
                                  child: const Text('Login'),
                                  style: ElevatedButton.styleFrom(
                                    primary: AppColors.deepOrange300,
                                  ),
                                  onPressed: () {},
                                ),
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  const Text(
                                    'Don\'t have an account?',
                                    style: TextStyle(
                                      fontWeight: FontWeight.normal,
                                      fontSize: 14,
                                    ),
                                  ),
                                  TextButton(
                                    child: const Text(
                                      'Sign-up',
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 14,
                                        color: AppColors.black,
                                      ),
                                    ),
                                    onPressed: () {
                                      _controller.animateTo(1);
                                    },
                                  ),
                                ],
                              ),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: const [
                                      Expanded(
                                        child: Padding(
                                          padding: EdgeInsets.only(right: 10),
                                          child: Divider(
                                            color: AppColors.grey600,
                                          ),
                                        ),
                                      ),
                                      Text(
                                        'Or login with',
                                        style: TextStyle(
                                          fontWeight: FontWeight.normal,
                                          fontSize: 14,
                                        ),
                                      ),
                                      Expanded(
                                        child: Padding(
                                          padding: EdgeInsets.only(left: 10),
                                          child: Divider(
                                            color: AppColors.grey600,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(top: 8),
                                    child: FloatingActionButton(
                                      child: Image.asset(
                                        AppImages.google,
                                        width: 25,
                                      ),
                                      backgroundColor: AppColors.white,
                                      onPressed: () {},
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(
                                  left: 16,
                                  right: 16,
                                  top: 22,
                                ),
                                child: TextFormField(
                                  focusNode: _focusSignUpEmail,
                                  cursorColor: AppColors.deepOrange300,
                                  keyboardType: TextInputType.emailAddress,
                                  decoration: InputDecoration(
                                    prefixIcon: Icon(
                                      Icons.email_outlined,
                                      color: _focusSignUpEmail.hasFocus
                                          ? AppColors.deepOrange300
                                          : AppColors.grey600,
                                    ),
                                    label: const Text('Email'),
                                    labelStyle: TextStyle(
                                      color: _focusSignUpEmail.hasFocus
                                          ? AppColors.deepOrange300
                                          : AppColors.grey600,
                                    ),
                                    border: const OutlineInputBorder(),
                                    enabledBorder: const OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: AppColors.grey600,
                                      ),
                                    ),
                                    focusedBorder: const OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: AppColors.deepOrange300,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(
                                  left: 16,
                                  right: 16,
                                  top: 16,
                                ),
                                child: TextFormField(
                                  focusNode: _focusSignUpPassword,
                                  cursorColor: AppColors.deepOrange300,
                                  obscureText: true,
                                  keyboardType: TextInputType.text,
                                  decoration: InputDecoration(
                                    prefixIcon: Icon(
                                      Icons.password_outlined,
                                      color: _focusSignUpPassword.hasFocus
                                          ? AppColors.deepOrange300
                                          : AppColors.grey600,
                                    ),
                                    label: const Text('Password'),
                                    labelStyle: TextStyle(
                                      color: _focusSignUpPassword.hasFocus
                                          ? AppColors.deepOrange300
                                          : AppColors.grey600,
                                    ),
                                    border: const OutlineInputBorder(),
                                    enabledBorder: const OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: AppColors.grey600,
                                      ),
                                    ),
                                    focusedBorder: const OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: AppColors.deepOrange300,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(
                                  left: 16,
                                  right: 16,
                                  top: 16,
                                ),
                                child: TextFormField(
                                  focusNode: _focusSignUpRepeatPassword,
                                  cursorColor: AppColors.deepOrange300,
                                  obscureText: true,
                                  keyboardType: TextInputType.text,
                                  decoration: InputDecoration(
                                    prefixIcon: Icon(
                                      Icons.password_outlined,
                                      color: _focusSignUpRepeatPassword.hasFocus
                                          ? AppColors.deepOrange300
                                          : AppColors.grey600,
                                    ),
                                    label: const Text('Repeat Password'),
                                    labelStyle: TextStyle(
                                      color: _focusSignUpRepeatPassword.hasFocus
                                          ? AppColors.deepOrange300
                                          : AppColors.grey600,
                                    ),
                                    border: const OutlineInputBorder(),
                                    enabledBorder: const OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: AppColors.grey600,
                                      ),
                                    ),
                                    focusedBorder: const OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: AppColors.deepOrange300,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              Container(
                                padding: const EdgeInsets.only(
                                  left: 16,
                                  right: 16,
                                  top: 16,
                                ),
                                width: MediaQuery.of(context).size.width,
                                child: ElevatedButton(
                                  child: const Text('Sign-up'),
                                  style: ElevatedButton.styleFrom(
                                    primary: AppColors.deepOrange300,
                                  ),
                                  onPressed: () {},
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
