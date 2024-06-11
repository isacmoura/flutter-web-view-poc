import 'package:dio/dio.dart';
import 'package:webview_flutter_poc/models/user.dart';
import 'package:webview_flutter_poc/resources/app_consts.dart';

class AuthService {
  final Dio _dio = Dio(
    BaseOptions(
      baseUrl: AppConsts.baseApiUrl,
      connectTimeout: const Duration(seconds: AppConsts.connectTimeoutSeconds),
      receiveTimeout: const Duration(seconds: AppConsts.receiveTimeoutSeconds),
    ),
  );

  Future<String?> signIn(User user) async {
    try {
      final response = await _dio.post(
        'auth/signin',
        data: user.toJson(),
      );

      return response.data['token'];
    } catch (_) {
      throw Exception('Failed to sign in');
    }
  }
}