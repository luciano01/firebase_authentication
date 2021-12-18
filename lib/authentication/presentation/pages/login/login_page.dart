import 'package:firebase_authentication/authentication/presentation/mobx/login/login_store.dart';
import 'package:firebase_authentication/authentication/presentation/widgets/home/dont_have_account_widget.dart';
import 'package:firebase_authentication/authentication/presentation/widgets/home/login_sign_in_button_widget.dart';
import 'package:firebase_authentication/authentication/presentation/widgets/home/or_login_with_widget.dart';
import 'package:firebase_authentication/authentication/presentation/widgets/home/text_form_field_widget.dart';
import 'package:firebase_authentication/core/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({
    Key? key,
  }) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final LoginStore store = Modular.get<LoginStore>();

  final _formKey = GlobalKey<FormState>();

  late FocusNode _focusEmail;
  late FocusNode _focusPassword;

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
    _focusEmail = FocusNode();
    _focusPassword = FocusNode();

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
    return Form(
      key: _formKey,
      autovalidateMode: store.autoValidateMode,
      child: ListView(
        physics: const BouncingScrollPhysics(),
        children: [
          TextFormFieldWidget(
            focusNode: _focusEmail,
            keyboardType: TextInputType.emailAddress,
            label: 'Email',
            icon: Icons.email_outlined,
            validator: store.validateEmail,
            onChanged: store.setEmail,
          ),
          const SizedBox(height: 16),
          TextFormFieldWidget(
            focusNode: _focusPassword,
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
          const DontHaveAccountWidget(
            message: 'Don\'t have an account?',
            label: 'Sign-up',
          ),
          OrLoginWithWidget(
            message: 'Or login with',
            label: 'Google SignIn',
            onPressed: () {
              store.getGoogleLogin();
            },
          ),
        ],
      ),
    );
  }
}
