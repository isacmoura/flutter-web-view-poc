import 'package:flutter/material.dart';
import 'package:webview_flutter_poc/models/user.dart';
import 'package:webview_flutter_poc/resources/app_strings.dart';
import 'package:webview_flutter_poc/viewmodels/sign_in_viewmodel.dart';

class SignInForm extends StatefulWidget {
  const SignInForm({super.key, required this.viewModel});
  final SignInViewmodel viewModel;

  @override
  State<SignInForm> createState() => _SignInFormState();
}

class _SignInFormState extends State<SignInForm> {
  final _signInFormKey = GlobalKey<FormState>();
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _signInFormKey,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          TextFormField(
            controller: usernameController,
            decoration: const InputDecoration(
              labelText: AppStrings.signInPageUsernameLabel,
            ),
            validator: (value) {
              if (value!.isEmpty) {
                return AppStrings.signInPageUsernameRequired;
              }
              return null;
            },
          ),
          TextFormField(
            controller: passwordController,
            obscureText: true,
            decoration: const InputDecoration(
              labelText: AppStrings.signInPagePasswordLabel,
            ),
            validator: (value) {
              if (value!.isEmpty) {
                return AppStrings.signInPagePasswordRequired;
              }
              return null;
            },
          ),
          const SizedBox(height: 15),

          if(widget.viewModel.isLoading)
            const CircularProgressIndicator()
          else
            ElevatedButton(
              onPressed: () {
                if (_signInFormKey.currentState!.validate()) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text(AppStrings.signInPageSignInSending),
                    ),
                  );
                  
                  final user = User(
                    username: usernameController.text,
                    password: passwordController.text,
                  );

                  widget.viewModel.signIn(user);
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text(AppStrings.signInPageSignInFailed),
                    ),
                  );
                }
              },
              child: const Text(AppStrings.signInPageSignInButton),
            ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    usernameController.dispose();
    passwordController.dispose();
    super.dispose();
  }
}