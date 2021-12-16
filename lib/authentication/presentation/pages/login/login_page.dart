import 'package:firebase_authentication/authentication/presentation/widgets/home/dont_have_account_widget.dart';
import 'package:firebase_authentication/authentication/presentation/widgets/home/image_widget.dart';
import 'package:firebase_authentication/authentication/presentation/widgets/home/infor_widget.dart';
import 'package:firebase_authentication/authentication/presentation/widgets/home/login_sign_in_button_widget.dart';
import 'package:firebase_authentication/authentication/presentation/widgets/home/or_login_with_widget.dart';
import 'package:firebase_authentication/authentication/presentation/widgets/home/text_form_field_widget.dart';
import 'package:firebase_authentication/core/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

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
      backgroundColor: AppColors.deepOrange50,
      body: CustomScrollView(
        physics: const BouncingScrollPhysics(),
        shrinkWrap: true,
        slivers: [
          SliverToBoxAdapter(
            child: SizedBox(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              child: Column(
                children: [
                  Container(
                    color: AppColors.deepOrange50,
                    child: Stack(
                      children: [
                        InforWidget(
                          onPressed: () {},
                        ),
                        const ImageWidget(),
                      ],
                    ),
                  ),
                  Expanded(
                    flex: 3,
                    child: Container(
                      decoration: const BoxDecoration(
                        color: AppColors.white,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(4),
                          topRight: Radius.circular(4),
                        ),
                      ),
                      child: Column(
                        children: [
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
                          Expanded(
                            child: TabBarView(
                              controller: _controller,
                              physics: const NeverScrollableScrollPhysics(),
                              children: [
                                Column(
                                  children: [
                                    TextFormFieldWidget(
                                      focusNode: _focusLoginEmail,
                                      keyboardType: TextInputType.emailAddress,
                                      label: 'Email',
                                      icon: Icons.email_outlined,
                                    ),
                                    TextFormFieldWidget(
                                      focusNode: _focusLoginPassword,
                                      keyboardType: TextInputType.text,
                                      label: 'Password',
                                      icon: Icons.password_outlined,
                                    ),
                                    LoginSignInButtonWidget(
                                      label: 'Login',
                                      onPressed: () {
                                        Modular.to.pushReplacementNamed(
                                          '/home',
                                        );
                                      },
                                    ),
                                    DontHaveAccountWidget(
                                      controller: _controller,
                                      label: 'Sign-up',
                                      message: 'Don\'t have an account?',
                                      onPressed: () {
                                        _controller.animateTo(1);
                                      },
                                    ),
                                    OrLoginWithWidget(
                                      message: 'Or login with',
                                      label: 'Google SignIn',
                                      onPressed: () {},
                                    ),
                                  ],
                                ),
                                Column(
                                  children: [
                                    TextFormFieldWidget(
                                      focusNode: _focusSignUpEmail,
                                      keyboardType: TextInputType.emailAddress,
                                      label: 'Email',
                                      icon: Icons.email_outlined,
                                    ),
                                    TextFormFieldWidget(
                                      focusNode: _focusSignUpPassword,
                                      keyboardType: TextInputType.text,
                                      label: 'Password',
                                      icon: Icons.password_outlined,
                                    ),
                                    TextFormFieldWidget(
                                      focusNode: _focusSignUpRepeatPassword,
                                      keyboardType: TextInputType.text,
                                      label: 'Repeat Password',
                                      icon: Icons.password_outlined,
                                    ),
                                    LoginSignInButtonWidget(
                                      label: 'Sign-up',
                                      onPressed: () {},
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
