import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:webview_flutter_poc/repositories/auth_repository.dart';
import 'package:webview_flutter_poc/resources/app_strings.dart';
import 'package:webview_flutter_poc/services/auth_service.dart';
import 'package:webview_flutter_poc/viewmodels/sign_in_viewmodel.dart';
import 'package:webview_flutter_poc/views/sign_in_page.dart';

void main() {
  runApp(const WebViewPoC());
}

class WebViewPoC extends StatelessWidget {
  const WebViewPoC({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<AuthService>(create: (_) => AuthService()),
        ProxyProvider<AuthService, AuthRepository>(update: (_, authService, __) => AuthRepository(authService)),
        ChangeNotifierProvider<SignInViewmodel>(
          create: (context) => SignInViewmodel(
            context.read<AuthRepository>(),
          ),
        ),
      ],
      child: MaterialApp(
        title: AppStrings.appName,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: const SignInPage(),
      ),
    );
  }
}