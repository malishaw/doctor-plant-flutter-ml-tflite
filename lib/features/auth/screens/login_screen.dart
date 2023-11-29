
import 'package:flutter/material.dart';
import 'package:leafdiseasedetection/features/auth/screens/register_screen.dart';

import '../../../shared/models/user_model.dart';
import '../../../shared/widgets/app_main_button.dart';
import '../../../shared/widgets/custom_input_field.dart';
import '../../select_mode/screens/select_mode_screen.dart';
import '../auth_service.dart';

class LoginScreen extends StatelessWidget {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  void _login(BuildContext context) async {
    AuthService authService = AuthService();
    User loginUser = User(
      username: _usernameController.text,
      password: _passwordController.text,
    );

    bool loginResult = await authService.login(loginUser);

    if(_usernameController.text.isEmpty || _passwordController.text.isEmpty){
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Text('Login Failed'),
          content: Text('Please Fill Login Details'),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: Text('OK'),
            ),
          ],
        ),
      );
      // Navigator.pushReplacement(
      //   context,
      //   MaterialPageRoute(builder: (context) => SelectModeScreen()),
      // );
    } else{
      if (loginResult) {
        // Login successful, navigate to home screen
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => SelectModeScreen()),
        );
      } else {
        // Invalid credentials
        showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: Text('Login Failed'),
            content: Text('Invalid username or password.'),
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


  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(
                width: double.infinity,
                height: 30,
              ),
              Image.asset(
                'assets/images/logo.png',
                width: 220,
              ),
              const SizedBox(
                width: double.infinity,
                height: 30,
              ),
              const Text(
                "Login into your account",
                style: TextStyle(fontStyle: FontStyle.italic, fontSize: 20, fontWeight: FontWeight.bold, color: Colors.grey),
              ),
              const SizedBox(
                width: double.infinity,
                height: 30,
              ),
              CustomeTextInputField(
                hintText: "Your Username",
                label: "Username*",
                controller: _usernameController,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter username';
                  }
                  return null;
                },
              ),
              CustomeTextInputField(
                hintText: "Enter password*",
                label: "Password",
                obscureText: true,
                keyboardType: TextInputType.text,
                controller: _passwordController,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter password number';
                  }
                  return null;
                },
              ),
              const SizedBox(
                width: double.infinity,
                height: 30,
              ),
              AppMainButton(
                text: "SIGN IN",
                onPressed: () {
                  _login(context);
                },
                width: MediaQuery.of(context).size.width * 3 / 4,
              ),
              SizedBox(height: 30,),
              Row(
                children: [
                  Text("Don't have an account", style: TextStyle(fontSize: 16),),
                  GestureDetector(
                      onTap: () {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (context) => RegisterScreen()),
                        );
                      },
                      child:  const Text(
                        " Sign up",
                        style: TextStyle(
                            fontSize: 17,
                            fontWeight: FontWeight.bold,
                            decoration: TextDecoration.underline
                        ),
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