import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../services/auth_services.dart';
import '../widgets/animated_button.dart';
import 'phone_login_screen.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({Key? key}) : super(key: key);

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  final _formKey = GlobalKey<FormState>();
  bool isLogin = true;
  String fullName = '';
  String phoneNumber = '';
  String email = '';
  String password = '';
  String confirmPassword = '';
  bool loading = false;
  String error = '';

  @override
  Widget build(BuildContext context) {
    final auth = Provider.of<AuthService>(context, listen: false);
    final theme = Theme.of(context);

    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24),
          child: Container(
            constraints: const BoxConstraints(maxWidth: 450),
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 32),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(24),
              boxShadow: const [
                BoxShadow(
                  color: Colors.black12,
                  blurRadius: 12,
                  offset: Offset(0, 8),
                ),
              ],
            ),
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  Image.asset('assets/images/logo_qi.png', height: 80),
                  const SizedBox(height: 20),
                  Text(
                    isLogin ? 'Welcome Back' : 'Create Account',
                    style: theme.textTheme.headlineSmall?.copyWith(
                      fontWeight: FontWeight.bold,
                      color: Colors.black87,
                    ),
                  ),
                  const SizedBox(height: 24),
                  if (!isLogin)
                    TextFormField(
                      decoration: const InputDecoration(
                        labelText: 'Full Name',
                        prefixIcon: Icon(Icons.person_outline),
                      ),
                      onChanged: (val) => setState(() => fullName = val),
                      validator: (val) =>
                          val!.isEmpty ? 'Enter your name' : null,
                    ),
                  if (!isLogin) const SizedBox(height: 16),
                  if (!isLogin)
                    TextFormField(
                      decoration: const InputDecoration(
                        labelText: 'Phone Number',
                        prefixIcon: Icon(Icons.phone),
                      ),
                      keyboardType: TextInputType.phone,
                      onChanged: (val) => setState(() => phoneNumber = val),
                      validator: (val) =>
                          val!.isEmpty ? 'Enter phone number' : null,
                    ),
                  if (!isLogin) const SizedBox(height: 16),
                  TextFormField(
                    decoration: const InputDecoration(
                      labelText: 'Email',
                      prefixIcon: Icon(Icons.email_outlined),
                    ),
                    onChanged: (val) => setState(() => email = val.trim()),
                    validator: (val) =>
                        val!.isEmpty ? 'Enter your email' : null,
                  ),
                  const SizedBox(height: 16),
                  TextFormField(
                    obscureText: true,
                    decoration: const InputDecoration(
                      labelText: 'Password',
                      prefixIcon: Icon(Icons.lock_outline),
                    ),
                    onChanged: (val) => setState(() => password = val),
                    validator: (val) =>
                        val!.length < 6 ? 'Password too short' : null,
                  ),
                  if (!isLogin) const SizedBox(height: 16),
                  if (!isLogin)
                    TextFormField(
                      obscureText: true,
                      decoration: const InputDecoration(
                        labelText: 'Confirm Password',
                        prefixIcon: Icon(Icons.lock),
                      ),
                      onChanged: (val) => setState(() => confirmPassword = val),
                      validator: (val) =>
                          val != password ? 'Passwords do not match' : null,
                    ),
                  const SizedBox(height: 24),
                  loading
                      ? const CircularProgressIndicator()
                      : SizedBox(
                          width: double.infinity,
                          child: AnimatedButton(
                            label: isLogin ? 'Sign In' : 'Sign Up',
                            onPressed: () async {
                              if (_formKey.currentState!.validate()) {
                                setState(() => loading = true);

                                dynamic result;
                                if (isLogin) {
                                  result = await auth.signInWithEmail(
                                      email, password);
                                } else {
                                  result = await auth.signUpWithEmail(
                                      email, password);

                                  if (result != null) {
                                    final uid =
                                        (await auth.getCurrentUser())?.uid;
                                    if (uid != null) {
                                      await FirebaseFirestore.instance
                                          .collection('users')
                                          .doc(uid)
                                          .set({
                                        'fullName': fullName,
                                        'email': email,
                                        'phone': phoneNumber,
                                        'createdAt':
                                            FieldValue.serverTimestamp(),
                                      });
                                    }
                                  }
                                }

                                if (result == null) {
                                  setState(() {
                                    loading = false;
                                    error = 'Authentication failed';
                                  });
                                }
                              }
                            },
                          ),
                        ),
                  const SizedBox(height: 16),
                  TextButton(
                    onPressed: () => setState(() => isLogin = !isLogin),
                    child: Text(
                      isLogin
                          ? 'New user? Create an account'
                          : 'Already have an account? Sign in',
                      style: const TextStyle(color: Colors.deepPurple),
                    ),
                  ),
                  const Divider(height: 32),
                  AnimatedButton(
                    label: 'Sign in with Google',
                    icon: Icons.g_mobiledata,
                    color: Colors.deepOrange,
                    onPressed: () async {
                      setState(() => loading = true);
                      final result = await auth.signInWithGoogle();
                      if (result == null) {
                        setState(() {
                          loading = false;
                          error = 'Google sign-in failed';
                        });
                      }
                    },
                  ),
                  const SizedBox(height: 16),
                  TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (_) => const PhoneLoginScreen()),
                      );
                    },
                    child: const Text(
                      'Sign in with Phone Number',
                      style: TextStyle(color: Colors.deepPurple),
                    ),
                  ),
                  if (error.isNotEmpty) ...[
                    const SizedBox(height: 12),
                    Text(error,
                        style: const TextStyle(color: Colors.redAccent)),
                  ],
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
