import 'package:flutter/material.dart';
import 'package:personal_finance_manager_using_flutter_firebase/auth/signin.dart';
import 'package:personal_finance_manager_using_flutter_firebase/widgets/awesomeclipper.dart';
import 'package:personal_finance_manager_using_flutter_firebase/widgets/customtextfield.dart';

class SignupScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            ClipPath(
              clipper: AwesomeClipper(),
              child: Container(
                height: 250,
                color: Colors.blue.shade900,
                child: Center(
                  child: Text(
                    'Sign Up',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  CustomTextFormField(
                    labelText: 'Username',
                    icon: Icons.person,
                  ),
                  SizedBox(height: 16),
                  CustomTextFormField(
                    labelText: 'Email',
                    icon: Icons.email,
                  ),
                  SizedBox(height: 16),
                  CustomTextFormField(
                    labelText: 'Password',
                    icon: Icons.lock,
                    obscureText: true,
                  ),
                  SizedBox(height: 32),
                  ElevatedButton(
                    onPressed: () {
                      // Handle signup logic
                    },
                    style: ElevatedButton.styleFrom(
                      padding:
                          EdgeInsets.symmetric(horizontal: 100, vertical: 15),
                      backgroundColor: Colors.blue.shade900,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                    child: Text(
                      'Sign Up',
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  SizedBox(height: 16),
                  TextButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => SigninScreen(),
                          ));
                    },
                    child: Text(
                      'Already have an account? Login',
                      style: TextStyle(color: Colors.blue.shade900),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
