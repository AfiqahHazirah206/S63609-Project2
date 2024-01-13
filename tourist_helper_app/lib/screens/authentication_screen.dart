import 'package:flutter/material.dart';
import 'package:tourist_helper_app/widgets/custom_button.dart';
import 'package:tourist_helper_app/widgets/custom_text_field.dart';
import 'package:tourist_helper_app/services/authentication_service.dart';

class AuthenticationScreen extends StatefulWidget {
  @override
  _AuthenticationScreenState createState() => _AuthenticationScreenState();
}

class _AuthenticationScreenState extends State<AuthenticationScreen> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final AuthenticationService authService = AuthenticationService();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  bool _isLogin = true; // Default to login mode

  void _toggleMode() {
    setState(() {
      _isLogin = !_isLogin;
    });
  }

  void _authenticate() async {
    if (_formKey.currentState!.validate()) {
      if (_isLogin) {
        // If in login mode
        Map<String, dynamic> authResult = (await authService.login(
          emailController.text,
          passwordController.text,
        )) as Map<String, dynamic>;

        if (authResult.containsKey('error')) {
          // Show error message
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text('Failed to login: ${authResult['error']}'),
            ),
          );
        } else {
          // Handle the response data if needed
          print('Login successful: $authResult');
          // Navigate to the next screen (e.g., HomeScreen)
          Navigator.popAndPushNamed(context, '/home');
        }
      } else {
        // If in registration mode
        Map<String, dynamic> authResult = (await authService.register(
          emailController.text,
          passwordController.text,
        )) as Map<String, dynamic>;

        if (authResult.containsKey('error')) {
          // Show error message
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text('Failed to register: ${authResult['error']}'),
            ),
          );
        } else {
          // Handle the response data if needed
          print('Registration successful: $authResult');
          // Show success message or navigate to login screen
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text('Account created successfully'),
            ),
          );
        }
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Authentication'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              CustomTextField(
                controller: emailController,
                labelText: 'Email',
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your email';
                  }
                  return null;
                },
              ),
              SizedBox(height: 16.0),
              CustomTextField(
                controller: passwordController,
                labelText: 'Password',
                obscureText: true,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your password';
                  }
                  return null;
                },
              ),
              SizedBox(height: 16.0),
              CustomButton(
                onPressed: _authenticate,
                text: _isLogin ? 'Login' : 'Create Account',
              ),
              SizedBox(height: 16.0),
              TextButton(
                onPressed: _toggleMode,
                child: Text(_isLogin
                    ? 'Create an account'
                    : 'Already have an account? Login'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
