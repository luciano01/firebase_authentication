import 'package:firebase_authentication/authentication/presentation/mobx/login/login_store.dart';
import 'package:firebase_authentication/authentication/presentation/widgets/home/dont_have_account_widget.dart';
import 'package:firebase_authentication/authentication/presentation/widgets/home/image_widget.dart';
import 'package:firebase_authentication/authentication/presentation/widgets/home/infor_widget.dart';
import 'package:firebase_authentication/authentication/presentation/widgets/home/login_sign_in_button_widget.dart';
import 'package:firebase_authentication/authentication/presentation/widgets/home/or_login_with_widget.dart';
import 'package:firebase_authentication/authentication/presentation/widgets/home/text_form_field_widget.dart';
import 'package:firebase_authentication/core/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';

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

  final LoginStore store = Modular.get<LoginStore>();
  final _formKey = GlobalKey<FormState>();

  var overlayLoading = OverlayEntry(
    builder: (BuildContext context) {
      return AlertDialog(
        backgroundColor: AppColors.deepOrange50,
        content: Wrap(
          children: [
            Center(
              child: Row(
                children: const [
                  CircularProgressIndicator(
                    valueColor: AlwaysStoppedAnimation<Color>(
                      AppColors.deepOrange300,
                    ),
                  ),
                  SizedBox(width: 15),
                  Text(
                    'Processing, wait...',
                    style: TextStyle(
                      color: AppColors.black,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      );
    },
  );

  @override
  void initState() {
    _controller = TabController(length: 2, vsync: this);
    _focusLoginEmail = FocusNode();
    _focusLoginPassword = FocusNode();
    _focusSignUpEmail = FocusNode();
    _focusSignUpPassword = FocusNode();
    _focusSignUpRepeatPassword = FocusNode();

    reaction<bool>((_) => (store.loading), (isLoading) {
      if (isLoading) {
        Overlay.of(context)?.insert(overlayLoading);
      } else {
        overlayLoading.remove();
      }
    });

    reaction((_) => store.errorMessage, (hasError) {
      if (hasError != null) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            duration: const Duration(seconds: 3),
            behavior: SnackBarBehavior.floating,
            backgroundColor: Colors.red,
            content: Row(
              children: [
                const Icon(
                  Icons.error_outline,
                  color: Colors.white,
                ),
                const SizedBox(width: 10),
                Expanded(child: Text(store.errorMessage!)),
              ],
            ),
            action: SnackBarAction(
              label: 'Try Again',
              textColor: Colors.white,
              onPressed: () {
                ScaffoldMessenger.of(context).hideCurrentSnackBar();
              },
            ),
          ),
        );
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.deepOrange50,
      body: Form(
        key: _formKey,
        autovalidateMode: store.autoValidateMode,
        child: SingleChildScrollView(
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
                    children: [
                      ListView(
                        physics: const BouncingScrollPhysics(),
                        children: [
                          TextFormFieldWidget(
                            focusNode: _focusLoginEmail,
                            keyboardType: TextInputType.emailAddress,
                            label: 'Email',
                            icon: Icons.email_outlined,
                            validator: store.validateEmail,
                            onChanged: store.setEmail,
                          ),
                          const SizedBox(height: 16),
                          TextFormFieldWidget(
                            focusNode: _focusLoginPassword,
                            keyboardType: TextInputType.text,
                            label: 'Password',
                            icon: Icons.password_outlined,
                            validator: store.validatePassword,
                            onChanged: store.setPassword,
                          ),
                          LoginSignInButtonWidget(
                            label: 'Login',
                            onPressed: () {
                              if (_formKey.currentState!.validate()) {
                                store
                                    .signInWithEmailAndPassword(
                                  email: store.email,
                                  password: store.password,
                                )
                                    .then((_) {
                                  store.setErrorMessage(null);
                                });
                              }
                            },
                          ),
                          DontHaveAccountWidget(
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
                      ListView(
                        children: [
                          TextFormFieldWidget(
                            focusNode: _focusSignUpEmail,
                            keyboardType: TextInputType.emailAddress,
                            label: 'Email',
                            icon: Icons.email_outlined,
                            validator: (value) {},
                            onChanged: (value) {},
                          ),
                          const SizedBox(height: 8),
                          TextFormFieldWidget(
                            focusNode: _focusSignUpPassword,
                            keyboardType: TextInputType.text,
                            label: 'Password',
                            icon: Icons.password_outlined,
                            validator: (value) {},
                            onChanged: (value) {},
                          ),
                          const SizedBox(height: 8),
                          TextFormFieldWidget(
                            focusNode: _focusSignUpRepeatPassword,
                            keyboardType: TextInputType.text,
                            label: 'Repeat Password',
                            icon: Icons.password_outlined,
                            validator: (value) {},
                            onChanged: (value) {},
                          ),
                          const SizedBox(height: 16),
                          LoginSignInButtonWidget(
                            label: 'Sign-up',
                            onPressed: () {},
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
