import 'package:convo/Features/authorisation/repositry/auth_repositry.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final authControllerProvider = Provider((ref) {
  final authRepositry = ref.watch(authRepositryProvider);
  return AuthController(authRepositry: authRepositry);
});

class AuthController {
  final AuthRepositry authRepositry;
  AuthController({
    required this.authRepositry,
  });

  void signInWithPhone(BuildContext context, String phoneNumber) {
    authRepositry.signInWithPhone(context, phoneNumber);
  }
}
