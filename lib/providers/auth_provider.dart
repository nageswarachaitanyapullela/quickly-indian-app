import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../services/auth_services.dart';

class AuthProvider with ChangeNotifier {
  final AuthService _authService = AuthService();
  User? _user;

  AuthProvider() {
    _authService.userStream.listen((firebaseUser) {
      _user = firebaseUser;
      notifyListeners();
    });
  }

  User? get currentUser => _user;

  bool get isAuthenticated => _user != null;

  Future<void> login(String email, String password) async {
    await _authService.signInWithEmail(email, password);
    // No need to call notifyListeners here – it's handled in stream.
  }

  Future<void> signup(String email, String password) async {
    await _authService.signUpWithEmail(email, password);
  }

  Future<void> signInWithGoogle() async {
    await _authService.signInWithGoogle();
  }

  Future<void> signInWithPhone({
    required String phoneNumber,
    required Function(String verificationId, int? resendToken) onCodeSent,
    required Function(FirebaseAuthException e) onFailed,
    required Function(PhoneAuthCredential credential) onCompleted,
  }) async {
    await _authService.verifyPhoneNumber(
      phoneNumber: phoneNumber,
      onCodeSent: onCodeSent,
      onFailed: onFailed,
      onVerificationCompleted: onCompleted,
    );
  }

  Future<void> verifyOtp(String verificationId, String smsCode) async {
    await _authService.verifyOTP(verificationId, smsCode);
  }

  Future<void> logout() async {
    await _authService.logout();
  }

  Stream<User?> get userChanges => _authService.userStream;
}
