import 'package:flutter/material.dart';

import '../../../shared/models/user_model.dart';
import '../../../shared/widgets/app_main_button.dart';
import '../../../shared/widgets/custom_input_field.dart';
import '../auth_service.dart';
import 'login_screen.dart';

class RegisterScreen extends StatelessWidget {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _confirmpasswordController =
      TextEditingController();

  void _register(BuildContext context) async {
    AuthService authService = AuthService();
    await authService.logout();

    User newUser = User(
      username: _usernameController.text,
      password: _passwordController.text,
    );

    bool registrationResult = await authService.register(newUser);

    if (registrationResult) {
      // Registration successful, navigate to login screen
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => LoginScreen()),
      );
    } else {
      // User already exists
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Text('Registration Failed'),
          content: Text('User already exists. Please login.'),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: Text('OK'),
            ),
          ],
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.green, title: Text('Register')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'assets/images/logo.png',
                width: 220,
              ),
              const Text(
                "Create new account",
                style: TextStyle(
                    fontStyle: FontStyle.italic,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.grey),
              ),
              CustomeTextInputField(
                hintText: "Enter Your Name",
                label: "Username",
                obscureText: false,
                keyboardType: TextInputType.text,
                controller: _usernameController,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter name number';
                  }
                  return null;
                },
              ),
              CustomeTextInputField(
                hintText: "Enter Your Mobile Number",
                label: "Mobile Number",
                obscureText: false,
                keyboardType: TextInputType.phone,
                controller: _nameController,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter mobile number';
                  }
                  return null;
                },
              ),
              CustomeTextInputField(
                hintText: "Enter Password",
                label: "Password",
                obscureText: true,
                keyboardType: TextInputType.phone,
                controller: _passwordController,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter name number';
                  }
                  return null;
                },
              ),
              SizedBox(
                height: 30,
              ),
              AppMainButton(
                text: "Register",
                onPressed: () {
                  _register(context);
                },
                width: MediaQuery.of(context).size.width * 3 / 4,
              ),
              SizedBox(
                height: 30,
              ),
              Row(
                children: [
                  Text("Already have an account?"),
                  GestureDetector(
                      onTap: () {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (context) => LoginScreen()),
                        );
                      },
                      child: const Text(
                        "Login",
                        style: TextStyle(
                            fontSize: 17,
                            fontWeight: FontWeight.bold,
                            decoration: TextDecoration.underline),
                      )),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
