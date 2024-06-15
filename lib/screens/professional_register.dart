import 'package:flutter/material.dart';
import '../routes/app_routes.dart';
import '../widget/background_color.dart';

class Professional_register extends StatefulWidget {
  const Professional_register({super.key});

  @override
  _Professional_registerState createState() => _Professional_registerState();
}

class _Professional_registerState extends State<Professional_register> {
  List<String> selectedWorkTypes = []; // List to store selected work types
  List<String> workTypes = [
    'Plumbing',
    'Electrical',
    'Carpentry',
    'Painting',
    'Cleaning',
    'Gardening',
    'HVAC',
    'Appliance Repair', // Add more unique work types as needed
  ];

  double _opacity = 0.0;

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
                        'Register Here',
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                      const SizedBox(height: 20),
                      const TextField(
                        decoration: InputDecoration(
                          labelText: 'Full Name',
                          labelStyle: TextStyle(fontSize: 25.0, color: Colors.black),
                        ),
                        style: TextStyle(fontSize: 25.0, color: Colors.black),
                      ),
                      const SizedBox(height: 20),
                      const TextField(
                        decoration: InputDecoration(
                          labelText: 'Email',
                          labelStyle: TextStyle(fontSize: 25.0, color: Colors.black),
                        ),
                        style: TextStyle(fontSize: 25.0, color: Colors.black),
                      ),
                      const SizedBox(height: 20),
                      const TextField(
                        decoration: InputDecoration(
                          labelText: 'Password',
                          labelStyle: TextStyle(fontSize: 25.0, color: Colors.black),
                        ),
                        style: TextStyle(fontSize: 25.0, color: Colors.black),
                        obscureText: true,
                      ),
                      const SizedBox(height: 20),
                      const TextField(
                        decoration: InputDecoration(
                          labelText: 'Re-type Password',
                          labelStyle: TextStyle(fontSize: 25.0, color: Colors.black),
                        ),
                        style: TextStyle(fontSize: 25.0, color: Colors.black),
                        obscureText: true,
                      ),
                      const SizedBox(height: 20),
                      DropdownButtonFormField<String>(
                        decoration: const InputDecoration(
                          labelText: 'Select Work Types',
                          labelStyle: TextStyle(fontSize: 25.0, color: Colors.black),
                        ),
                        value: selectedWorkTypes.isNotEmpty ? selectedWorkTypes.first : null,
                        items: workTypes.map((workType) {
                          return DropdownMenuItem<String>(
                            value: workType,
                            child: Text(workType),
                          );
                        }).toList(),
                        onChanged: (value) {
                          setState(() {
                            selectedWorkTypes = [value!];
                          });
                        },
                        isExpanded: true,
                        icon: const Icon(Icons.arrow_drop_down),
                        iconSize: 36.0,
                        iconEnabledColor: Colors.black,
                        style: const TextStyle(fontSize: 25.0, color: Colors.black),
                        dropdownColor: Colors.white,
                        elevation: 5,
                        hint: const Text(
                          'Select Work Types',
                          style: TextStyle(color: Colors.black, fontSize: 25.0),
                        ),
                      ),
                      const SizedBox(height: 20),
                      ElevatedButton(
                        onPressed: () {
                          // Navigate to the login screen using named route and remove all routes below it
                          Navigator.pushNamedAndRemoveUntil(
                            context,
                            Routes.login,
                                (route) => false,
                          );
                        },
                        child: const Text(
                          'Register',
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
