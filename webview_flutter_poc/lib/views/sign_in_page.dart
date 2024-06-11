import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:webview_flutter_poc/resources/app_spacings.dart';
import 'package:webview_flutter_poc/resources/app_strings.dart';
import 'package:webview_flutter_poc/viewmodels/sign_in_viewmodel.dart';
import 'package:webview_flutter_poc/views/widgets/sign_in_form.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({super.key});

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text(AppStrings.signInPageTitle),
      ),
      body: Consumer<SignInViewmodel>(
        builder: (context, viewModel, child) => Padding(
          padding: const EdgeInsets.all(AppSpacings.m),
          child: SignInForm(viewModel: viewModel),
        ),
      ),
    );
  }
}
