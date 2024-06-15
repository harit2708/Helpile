import 'package:flutter/material.dart';
import '../routes/app_routes.dart';
import '../widget/background_color.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  double _opacity = 0.0;
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  void initState() {
    super.initState();
    // Start animation when the screen is first built
    Future.delayed(const Duration(milliseconds: 100), () {
      setState(() {
        _opacity = 1.0;
      });
    });
  }

  void _showErrorDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Login Failed'),
          content: const Text('Please enter correct email and password.'),
          actions: <Widget>[
            TextButton(
              child: const Text('OK'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // Dismiss the keyboard when tapping anywhere on the screen
        FocusScope.of(context).unfocus();
      },
      child: SafeArea(
        child: Scaffold(
          body: BackgroundColor(
            child: Center(
              child: AnimatedOpacity(
                duration: const Duration(milliseconds: 500),
                opacity: _opacity,
                child: Padding(
                  padding: const EdgeInsets.all(50.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        'Login',
                        style: TextStyle(
                          fontSize: 25.0,
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 20),
                      TextField(
                        controller: _emailController,
                        decoration: const InputDecoration(
                          labelText: 'Email',
                          labelStyle: TextStyle(fontSize: 25.0, color: Colors.black),
                        ),
                        style: const TextStyle(fontSize: 25.0, color: Colors.black),
                      ),
                      const SizedBox(height: 20),
                      TextField(
                        controller: _passwordController,
                        decoration: const InputDecoration(
                          labelText: 'Password',
                          labelStyle: TextStyle(fontSize: 25.0, color: Colors.black),
                        ),
                        style: const TextStyle(fontSize: 25.0, color: Colors.black),
                        obscureText: true,
                      ),
                      const SizedBox(height: 20),
                      ElevatedButton(
                        onPressed: () {
                          // Perform login
                          String email = _emailController.text.trim();
                          String password = _passwordController.text.trim();

                          // Dummy check for demonstration
                          if (email == 'abc@gmail.com' && password == 'admin') {
                            // Navigate to the next screen on successful login
                            // For demo purpose, navigating to the AskScreen
                            Navigator.pushNamed(context, Routes.home_screen);
                          } else {
                            // Show error dialog for incorrect login
                            _showErrorDialog();
                          }
                        },
                        child: const Text(
                          'Login',
                          style: TextStyle(fontSize: 22.0, color: Colors.black),
                        ),
                      ),
                      const SizedBox(height: 10),
                      TextButton(
                        onPressed: () {
                          Navigator.pushNamed(context, Routes.register); // Navigate to RegisterScreen using named route
                        },
                        child: const Text(
                          'Register Here!!',
                          style: TextStyle(fontSize: 22.0, color: Colors.black),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
