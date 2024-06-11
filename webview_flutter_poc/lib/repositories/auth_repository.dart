import 'package:webview_flutter_poc/models/user.dart';
import 'package:webview_flutter_poc/services/auth_service.dart';

class AuthRepository {
  final AuthService _authService;

  AuthRepository(this._authService);

  Future<String?> signIn(User user) async {
    return _authService.signIn(user);
  }
}