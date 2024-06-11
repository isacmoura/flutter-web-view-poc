import 'package:flutter/material.dart';
import 'package:webview_flutter_poc/models/user.dart';
import 'package:webview_flutter_poc/repositories/auth_repository.dart';

class SignInViewmodel extends ChangeNotifier {
  final AuthRepository _authRepository;

  User? _user;
  bool _isLoading = false;

  User? get user => _user;
  bool get isLoading => _isLoading;

  SignInViewmodel(this._authRepository);

  void signIn(User user) {
    _isLoading = true;
    notifyListeners();

    try {
      _authRepository.signIn(user);
    } catch (_) {
      return;
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}